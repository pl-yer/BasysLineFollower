`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2021 01:18:09
// Design Name: 
// Module Name: servo_handler
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


module servo_handler(
    input wire clk,
    input wire rst,
    input wire [1:0] sensors,
    output reg [7:0] servo_l,
    output reg [7:0] servo_r   
    );

reg [7:0] servo_l_nxt;
reg [7:0] servo_r_nxt;
always @(posedge clk) begin
    if(rst) begin
     servo_l <=0;
     servo_r <=0;
    end
    else begin
    servo_l <=servo_l_nxt;
    servo_r <=servo_r_nxt;
    end
end

always @(*) begin
 if(sensors==3) begin
    servo_l_nxt = 155;
    servo_r_nxt = 137;
 end
 else if(sensors==1) begin
    servo_l_nxt = 155;
    servo_r_nxt =0;
  end
  else if(sensors==2) begin
    servo_l_nxt = 0;
    servo_r_nxt =137;
   end
   else begin
     servo_l_nxt = 0;
     servo_r_nxt =0;
   end
end

endmodule
