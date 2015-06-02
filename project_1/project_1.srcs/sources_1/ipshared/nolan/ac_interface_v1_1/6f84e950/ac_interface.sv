`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2015 01:50:55 AM
// Design Name: 
// Module Name: ac_interface
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ac_interface(
    // codec pins
    output reg AC_BCLK,     // i2s bit clock
    output reg AC_LRCLK,    // left/right frame clock
    output frame_sync,      // i2s frame sync for convenience
    
    output AC_PBDAT,        // playback data out
    input AC_RECDAT,        // record data in
    
    output reg AC_MUTEN,    // mute enable (active low)
    
    // other signals
    //input sysclk,         // 100MHz system clock
    input mclk,             // codec clock input from ps clock gen (12.288 MHz for 48kHz sample rate)
    input reset
    );
    
    localparam LRCLKDIV = 31;   // Frame clock = BCLK / 64
    localparam BCLKDIV = 1;     // Bit clock = MCLK / 4
    
    reg [7:0] lrclkDivCounter = 0;
    reg [7:0] bclkDivCounter = 0;
    
    // clock output registers
    reg mclk_internal = 0;

    // loopback audio
    assign AC_PBDAT = AC_RECDAT;
    
    // handle reset
    always_comb begin
        if(reset) begin
            //lrclkDivCounter = 0;  // reset clock gen counters
            //bclkDivCounter = 0;
            mclk_internal = 0;      // disable clock output
            AC_MUTEN = 0;           // mute during reset
        end
        else begin
            mclk_internal = mclk;   // enable clock gen
            AC_MUTEN = 1;           // unmute
        end
    end

    // BCLK generation
    always @(posedge mclk_internal) begin
        if(bclkDivCounter == BCLKDIV) begin
            AC_BCLK = ~AC_BCLK;
            bclkDivCounter = 0;
        end
        else
            bclkDivCounter += 1;
    end
    
    // LRCLK generation
    always @(posedge AC_BCLK) begin
        if(lrclkDivCounter == LRCLKDIV) begin
            AC_LRCLK = ~AC_LRCLK;
            lrclkDivCounter = 0;
        end
        else
            lrclkDivCounter += 1;
    end
    
    // set up frame sync
    assign frame_sync = ((lrclkDivCounter == 1) && !AC_LRCLK);
        
endmodule