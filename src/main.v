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
    input wire [1:0] sensor,
    input wire [1:0] sw,

    output wire [1:0] servo_steering
    );
    wire [1:0] sensors_signal;
    wire [1:0] sensors_state;
    wire [1:0] follower_state;
    wire [7:0] Wheel_Speed_R;
    wire [7:0] Wheel_Speed_L;
    wire [7:0] servo_signal;
    

// reg servo_direction_nxt;
reg [1:0] servo_direction, servo_direction_nxt;

localparam 
    REST_STATE  = 2'b00,
    LEFT_STATE  = 2'b01,
    RIGHT_STATE = 2'b11;

servo_handler my_servo (
    .clk(clk),
    .rst(rst),
   // .servo_direction(servo_direction),
    .servo(servo),
    .follower_state(sensors_state),
    .Wheel_Speed_L(Wheel_Speed_L),
    .Wheel_Speed_R(Wheel_Speed_R)
    //.follower_State(follower_state)
    );
    
    PID_controller my_PID(
    .sensors_signal(sensors_signal),
    .follower_state(follower_state),
    .servo_signal(servo),
    .Wheel_Speed_L(Wheel_Speed_L),
    .Wheel_Speed_R(Wheel_Speed_R)
    );
    
    input_control my_in (
    .a(sensor[0]),
    .R_sensor(sensor[1]),
    .sensors_signal(sensors_signal),
    .follower_state(follower_state)
    );
    servo_to_PWM my_PWM(
    .servo(servo),
    .PWM_L(servo_steering[0]),
    .PWM_R(servo_steering[1])
    
    );
    
    
/*always @(posedge clk) begin
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
end*/
    
endmodule
