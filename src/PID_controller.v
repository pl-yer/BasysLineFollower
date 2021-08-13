`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2021 19:57:15
// Design Name: 
// Module Name: PID_controler
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


module PID_controller(
input wire [1:0] sensors_signal,
input wire [1:0] follower_state,
input wire rst,
input wire clk,
input wire [7:0] servo_signal,
output reg [1:0] steer_signal,
output reg [7:0] Wheel_Speed_R,
output reg [7:0] Wheel_Speed_L
    );
endmodule
