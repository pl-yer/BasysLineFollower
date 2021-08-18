`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2021 00:58:09
// Design Name: 
// Module Name: main
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


module main(
    input wire clk,
    input wire rst,
    input wire [1:0] sensor,
    input wire [1:0] sw,

    output wire [1:0] servo_steering
    );
    wire [1:0] sensors_signal;
    wire [1:0] sensors_state;
    wire [1:0] follower_state;
    wire [7:0] Wheel_Speed_R;
    wire [7:0] Wheel_Speed_L;
    wire [7:0] servo_signal;
    reg [9:0] a =130;
    reg [9:0] b =130;
    
    
localparam 
    REST_STATE  = 2'b00,
    LEFT_STATE  = 2'b01,
    RIGHT_STATE = 2'b11;

servo_handler my_servo (
    .clk(clk),
    .rst(rst),
    .servo(servo_signal),
    .follower_state(follower_state),
    .Wheel_Speed_L(Wheel_Speed_L),
    .Wheel_Speed_R(Wheel_Speed_R)
);
    
PID_controller my_PID(
    .sensors_signal(sensors_signal),
    .follower_state(follower_state),
    .servo_signal(servo_signal),
    .Wheel_Speed_L(Wheel_Speed_L),
    .Wheel_Speed_R(Wheel_Speed_R)
 );
    
input_control my_in (
    .a(sensor[0]),
    .R_sensor(sensor[1]),
    .sensors_signal(sensors_signal),
    .follower_state(follower_state)
);
    
    
servo_to_PWM my_PWM(
    .clk(clk),
    .rst(rst),
    .servo_L(a),
    .servo_R(b),
    .PWM_L(servo_steering[0]),
    .PWM_R(servo_steering[1])
);
endmodule
