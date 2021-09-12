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
wire clk_state_machine;
wire [10:0] pid_output;

servo_handler my_servo (
    .clk(clk_state_machine),
    .rst(rst),
    .servo_l(Servo_L),
    .servo_r(Servo_R),
    .pid_output(pid_output)
);       

servo_to_PWM my_PWM(
    .clk(clk),
    .rst(rst),
    .servo_L(Servo_L),
    .servo_R(Servo_R),
    .PWM_L(servo[0]),
    .PWM_R(servo[1])
);

frequency_divider 
#(
    .freq(1000)
)    
my_divider(
    .clk100MHz(clk),
    .rst(rst),
    .clk_div(clk_state_machine)
 );
 
pid my_pid(
    .kp_sw(sw[0]),
    .ki_sw(sw[1]),
    .kd_sw(sw[2]),
    .clk(clk),
    .rst(rst),
    .sensors(sensor),
    .pid_output(pid_output)
 );

endmodule
