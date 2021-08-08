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
    input wire [1:0] servo_instruction,
    output wire [1:0] servo
    );

// 100MHz - board clock
// 20 ms  - servo counter
//  1/100,000,000         =  10 ns
//  20,000,000 / 10 [ns]  =  2,000,000 <- that's how big the counter should be 
//  2^21  =  2 097 152‬  <- counter resolution

// for 360 servo:       (value assumption)
// 2ms   -  full speed right
// 1ms   -  full speed left
// 1.5ms -  rest
     
endmodule
