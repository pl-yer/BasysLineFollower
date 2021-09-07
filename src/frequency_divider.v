`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2021 17:35:17
// Design Name: 
// Module Name: frequency_divider
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


module frequency_divider(
    input clk_100M,
    output reg clk_1K
    );
    reg [16:0] counter;
    always@(posedge clk_100M) begin
        counter =counter+1;
        if(counter>100000) begin
            clk_1K = !clk_1K;
            counter=0;
        end
        else begin
            clk_1K=clk_1K;
    end
    end
endmodule
