`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2021 13:12:33
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

module servo_to_PWM(
   input wire clk,
   input wire rst,
   input wire [7:0] servo_L,
   input wire [7:0] servo_R,
   output reg PWM_L,
   output reg PWM_R
   );

reg PWM_L_nxt;
reg PWM_R_nxt;
reg [19:0] counter,counter_nxt;
reg [20:0] servo_l_mul,servo_r_mul;
reg [7:0] servo_L_buf, servo_R_buf;

always@ (posedge clk) begin
   if(rst) begin
      counter <=0;
      PWM_L   <=0;
      PWM_R   <=0;
   end
   else begin
      counter <=counter_nxt;
      PWM_L   <=PWM_L_nxt;
      PWM_R   <=PWM_R_nxt;
   end
end 
    
always @* begin
   servo_l_mul =servo_L *1000;
   servo_r_mul =servo_R *1000;
   counter_nxt = counter+1;
   if(counter > 1000000) begin
      counter_nxt=0;
   end
   if(counter > servo_l_mul) begin
      PWM_L_nxt=0;
   end
   else begin
      PWM_L_nxt =1;
   end
   if(counter >servo_r_mul) begin
      PWM_R_nxt=0;
   end
   else begin
      PWM_R_nxt =1;
   end
end 
endmodule
