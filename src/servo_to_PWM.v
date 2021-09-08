`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2021 20:32:26
// Design Name: 
// Module Name: servo_to_PWM
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

//TODO
// updating PWM only every 20ms time interval 
module servo_to_PWM(
    input clk,
    input rst,
    input  [7:0] servo_L,
    input  [7:0] servo_R,
    output  reg PWM_L,
    output reg PWM_R
    );
    reg [19:0] counter =0;
    reg [20:0] servo_l_mul,servo_r_mul;
    
    always @ (posedge clk) begin
     servo_l_mul =servo_L *1000;
     servo_r_mul =servo_R *1000;
    counter = counter+1;
    if(counter > 1000000) begin
    counter=0;
    end
    if(counter > servo_l_mul) begin
    PWM_L=0;
    end
    else begin
    PWM_L =1;
    end
    if(counter >servo_r_mul) begin
       PWM_R=0;
    end
    else begin
       PWM_R =1;
    end
    end  
endmodule
