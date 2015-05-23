`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2015 01:08:27 AM
// Design Name: 
// Module Name: i2c_test
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


module i2c_test;
    reg clk, reset;
    wire i2c_sda, i2c_scl;
    
    i2c i2c(
        .clk(clk),
        .reset(reset),
        .i2c_sda(i2c_sda),
        .i2c_scl(i2c_scl)
    );
    
    initial begin
        clk = 0;
        reset = 1;
    end
    
    always
        #5 clk = !clk;
endmodule
