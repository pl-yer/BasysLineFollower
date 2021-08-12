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
    input wire [0:0] sensor,
    input wire [0:0] sw,

//    output reg [1:0] servo_direction,
    output wire [1:0] servo
    );

// reg servo_direction_nxt;
reg [1:0] servo_direction, servo_direction_nxt;

localparam 
    REST_STATE  = 2'b00,
    LEFT_STATE  = 2'b01,
    RIGHT_STATE = 2'b11;

servo_handler my_servo (
    .clk(clk),
    .rst(rst),
    .servo_direction(servo_direction),
    .servo(servo)
    );
    
    PID_controller my_PID(
    
    );
    
    input_control my_in (
    .a(clk),
    .R_sensor(rst)
    );
    
    
always @(posedge clk) begin
    if(rst) 
        servo_direction <= 0;
    else 
        servo_direction <= servo_direction_nxt;
end

always @(*) begin
    servo_direction_nxt = 0;
    if(sw[0])
        servo_direction_nxt = REST_STATE;
    else begin
        if(sensor[0])
            servo_direction_nxt = LEFT_STATE;
        else if(!sensor[0])
            servo_direction_nxt = RIGHT_STATE;
    end
end
    
endmodule
