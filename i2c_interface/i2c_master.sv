`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2015 02:57:23 AM
// Design Name: 
// Module Name: i2c_master
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


module i2c_master(
    input clk,
    output i2c_sda,
    output i2c_scl,
    input reset
    );
    
    parameter DELAY = 1000;
    
    reg i2c_clk = 0;
    reg start = 0;
    reg [6:0] address = 0;
    reg [7:0] data = 0;
    
    wire ready;
    
    // generate 100kHz clock
    always @(posedge clk) begin
        if(count == DELAY/2) begin
            i2c_clk = ~i2c_clk;
            count = 0;
        end
        else begin
            count = count + 1;
        end
    end
    
    i2c i2c(
        .clk(i2c_clk),
        .reset(reset),
        .start(start),
        .address(address),
        .data(data),
        .i2c_sda(i2c_sda),
        .i2c_scl(i2c_sdl),
        .ready(ready)
        );
        
    always @(posedge ready) begin
        
    end
    
endmodule
