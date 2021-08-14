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


module servo_to_PWM(
    input clk,
    input rst,
    input [7:0] servo,
    output  reg PWM_L,
    output wire PWM_R
    );
    reg [20:0] counter =0;
    reg [20:0] counter_nxt;
    
    always @ (posedge clk) begin
    counter = counter+1;
    if(counter > 2000000) begin
    counter=0;
    end
    if(counter >1000000) begin
    PWM_L=0;
    end
    else begin
    PWM_L =1;
    end
    end
   // assign PWM_L =0;
    assign PWM_R =0;
    
endmodule
