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
    input wire [3:0] sensor,
    input wire [2:0] sw,
    output wire [1:0] servo
    );
    
wire [7:0] Servo_R;
wire [7:0] Servo_L;
wire clk_40MHz;
wire clk_1KHz;
wire clk_100MHz;
wire [10:0] pid_output, position;

servo_handler my_servo (
    .clk(clk_1KHz),
    .rst(rst),
    .servo_l(Servo_L),
    .servo_r(Servo_R),
    .pid_output(pid_output)
);       

servo_to_PWM my_PWM(
    .clk(clk_100MHz),
    .rst(rst),
    .servo_L(Servo_L),
    .servo_R(Servo_R),
    .PWM_L(servo[0]),
    .PWM_R(servo[1])
);
clock_managment_unit my_clk(
.clk(clk),
.rst(rst),
.clk_100MHz(clk_100MHz),
.clk_40MHz(clk_40MHz),
.clk_1KHz(clk_1KHz)
);


pid my_pid(
    .kp_sw(sw[0]),
    .ki_sw(sw[1]),
    .kd_sw(sw[2]),
    .clk(clk_40MHz),
    .rst(rst),
    .position(position),
    .pid_output(pid_output)
);

sensor_handler my_sensors(
    .clk(clk_100MHz),
    .rst(rst),
    .sensors(sensor),
    .position(position)
);

endmodule
