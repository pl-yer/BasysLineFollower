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
    input wire [3:0] sensors,
    // input wire [0:0] sw,

    output wire [1:0] servo_steering
    );
//  8=====================D
wire kp_sw, ki_sw, kd_sw;
wire signed [12:0] servo_signal;

// servo_handler my_servo (
//     .clk(clk),
//     .rst(rst),
//     .servo(servo_signal),
//     .follower_state(follower_state),
//     .Wheel_Speed_L(Wheel_Speed_L),
//     .Wheel_Speed_R(Wheel_Speed_R)
// );
    
pid my_PID(
    .clk(clk),
    .rst(rst),
    .sensors(sensors),
    .kp_sw(kp_sw),
    .ki_sw(ki_sw),
    .kd_sw(kd_sw),
    .pid_output(servo_signal)
 );
     
servo_to_PWM my_PWM(
    .clk(clk),
    .rst(rst),
    .servo(servo_signal),
    .PWM_L(servo_steering[0]),
    .PWM_R(servo_steering[1])
);
endmodule
