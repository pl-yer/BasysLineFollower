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
    input wire [1:0] servo_direction,
    input wire rst,
    output reg [1:0] servo
    );

// 100MHz - board clock
// 20 ms  - servo counter
//  1/100,000,000         =  10 ns
//  20,000,000 / 10 [ns]  =  2,000,000 <- that's how big the counter should be 
//  2^21  =  2 097 152‬  -> 21 bit <- counter resolution

reg [20:0] counter, counter_nxt;

// for 360 servo:       (value assumption)
// 2ms   -  full speed left  -   10ns * 200,000clk
// 1ms   -  full speed right -   10ns * 100,000clk
// 1.5ms -  rest             -   10ns * 150,000clk

localparam 
    GO_REST  = 'd50000,
    GO_RIGHT = 0,
    GO_LEFT  = 'd100000,

    REST_STATE  = 2'b00,
    LEFT_STATE  = 2'b01,
    RIGHT_STATE = 2'b11;

reg [16:0] control, control_nxt;
reg servo_nxt;

always @(posedge clk) begin
    if(rst) begin
        servo[0] <= 0;
        counter  <= 0;
        control  <= 0;        
    end
    else begin
        servo[0] <= servo_nxt;
        counter  <= counter_nxt;   
        control  <= control_nxt;
    end
end

always @(*) begin
    counter_nxt = counter + 1;
    if(counter == 'd1999999)
        counter_nxt = 0;

    // if(counter < ('d100000 + control))
    //     servo_nxt = 1;
    // else 
    //     servo_nxt = 0;
    servo_nxt = (counter < ('d100000 + control)) ? 1 : 0;
    
    case(servo_direction)
        REST_STATE: 
            control_nxt = GO_REST;
        LEFT_STATE:
            control_nxt = GO_LEFT;
        RIGHT_STATE:
            control_nxt = GO_RIGHT;
        default:
            control_nxt = GO_REST;
    endcase

end

endmodule
