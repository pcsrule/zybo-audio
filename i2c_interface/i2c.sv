`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2015 08:26:00 PM
// Design Name: 
// Module Name: i2c
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
// Based on a guide by Tom Briggs: https://www.youtube.com/watch?v=skkyudHHSWY
// 
//////////////////////////////////////////////////////////////////////////////////


module i2c(
    input wire clk,
    input wire reset,
    input wire start,
    input wire [6:0] address,
    input wire [7:0] data,
    output reg i2c_sda,
    output i2c_scl,
    output wire ready
    );
    
    localparam STATE_IDLE = 0,
        STATE_START = 1,
        STATE_ADDR = 2,
        STATE_RW = 3,
        STATE_WACK = 4,
        STATE_DATA = 5,
        STATE_STOP = 6,
        STATE_WACK_DATA = 7;
    
    reg [7:0] state;
    reg [7:0] count;
    reg [6:0] saved_address;
    reg [7:0] saved_data;
    reg [9:0] clk_count = 0;
    reg i2c_scl_enable = 0;
    
    // output scl when necessary
    assign i2c_scl = (i2c_scl_enable == 0) ? 1 : ~clk;
    assign ready = (reset == 0) && (state == STATE_IDLE);
    
    // set when scl should be active
    always @(posedge clk) begin
        if(reset == 1) begin
            i2c_scl_enable <= 1;
        end
        else begin
            if(state == STATE_IDLE
                || state == STATE_START
                || state == STATE_STOP) begin
                i2c_scl_enable <= 0;
            end
            else begin
                i2c_scl_enable <= 1;
            end
        end
    end
    
    // i2c FSM
    always @(posedge clk) begin
        if(reset == 1) begin
            state <= 0;
            i2c_sda <= 1;
            count <= 8'd0;
            
        end
        else begin
            case(state)
            
                STATE_IDLE: begin // idle state
                    i2c_sda <= 1;
                    if(start) begin
                        state <= STATE_START;
                        saved_address <= address;
                        saved_data <= data;
                    end
                    else state <= STATE_IDLE;
                end
                
                STATE_START: begin // start state
                    i2c_sda <= 0;
                    state = STATE_ADDR;
                    count <= 6;
                end
                
                STATE_ADDR: begin // send address
                    i2c_sda <= saved_address[count];
                    if(count == 0) state <= STATE_RW;
                    else count <= count - 1;
                end
                
                STATE_RW: begin // send data
                    i2c_sda <= 1;
                    state <= STATE_WACK;
                end
                
                STATE_WACK: begin
                    state <= STATE_DATA;
                    // TODO wait for ack
                    count <= 7;
                end
                
                STATE_DATA: begin
                    i2c_sda <= saved_data[count];
                    if(count == 0) state <= STATE_WACK_DATA;
                    else count <= count - 1;
                end
                
                STATE_WACK_DATA: begin
                    state <= STATE_STOP;
                    // TODO wait for ack
                    
                end
                
                STATE_STOP: begin
                    i2c_sda <= 1;
                    state <= STATE_IDLE;
                end
            endcase
        end
    end
    
endmodule
