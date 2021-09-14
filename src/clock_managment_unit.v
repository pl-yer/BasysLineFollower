`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2021 19:10:56
// Design Name: 
// Module Name: clock_managment_unit
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


module clock_managment_unit(
    input wire clk,
    input wire rst,
    output wire clk_100MHz,
    output wire clk_40MHz,
    output wire clk_1KHz
    );
    
    frequency_divider 
    #(
        .freq(1000)
    )    
    my_1K_divider(
        .clk100MHz(clk),
        .rst(rst),
        .clk_div(clk_1KHz)
    );
    
    frequency_divider 
    #(
        .freq(40000000)
    )    
    my_40M_divider(
        .clk100MHz(clk),
        .rst(rst),
        .clk_div(clk_40MHz)
    );
     assign clk_100MHz =clk;
endmodule
