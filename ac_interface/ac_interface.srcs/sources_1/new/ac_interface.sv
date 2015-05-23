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
    output AC_BCLK,     // i2s clock
    output AC_PBDAT,    // playback data
    output AC_PBLRC,    // playback left/right clock
    input AC_RECDAT,    // record data
    output AC_RECLRC,   // record left/right clock
    inout AC_SDIN,      // i2c data
    output AC_SCLK,     // i2c clock
    output reg AC_MUTEN,    // mute enable (active low)
    output AC_MCLK,     // master clock (12.288 MHz for 48kHz sample rate)
    
    // other signals
    input sysclk,       // 100MHz system clock
    input mclk          // codec clock input
    );
    
    assign AC_MCLK = mclk;
    assign AC_BCLK = mclk;
    assign AC_PBDAT = AC_RECDAT;
    
    always_comb begin
        AC_MUTEN = 'b1; // enable output
    end
        
endmodule
