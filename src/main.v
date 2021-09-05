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
    output wire [1:0] led,
    output wire [1:0] servo
    );
    wire [7:0] Servo_R;
    wire [7:0] Servo_L;
     //   reg [9:0] a =155;       //down//132  /lewe

  //  reg [9:0] b =137;      //up   /171

servo_handler my_servo (
    .clk(clk),
    .rst(rst),
    .sensors(sensor),
    .servo_l(Servo_L),
    .servo_r(Servo_R)
);       
servo_to_PWM my_PWM(
    .clk(clk),
    .rst(rst),
    .servo_L(Servo_L),  //a
    .servo_R(Servo_R),
    .PWM_L(servo[0]),
    .PWM_R(servo[1])
);
assign led =sensor;
endmodule
