`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2015 11:40:16 AM
// Design Name: 
// Module Name: fsm
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


module fsm(
    input clock,
    input [15:0] pattern,
    input [15:0] settings,
    output reg[3:0] led);

    logic [1:0]     state, nextstate;
    logic [32:0]    clockAccumulator;
    logic           newClock;
        
    always @(posedge clock) begin
        if (clockAccumulator > 'd50_000_000) begin
            newClock = ~newClock;
            clockAccumulator = 0;
        end
        else begin
            clockAccumulator = clockAccumulator + 'b1;
        end
    end
 
    always_comb begin
        nextstate = settings[1:0];
            
        case(state)
            2'b00: led = pattern[15:12];
            2'b01: led = pattern[11:8];
            2'b10: led = pattern[7:4];
            2'b11: led = pattern[3:0];
        endcase
    end
    
    always @(posedge newClock) begin
        if (settings == 'b0)
            state = 2'b00;
        else
            state = nextstate;
    end
    
endmodule
