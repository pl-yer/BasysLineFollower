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
    input  wire clk,
    input  wire rst,
    input  wire [10:0] pid_output,
    output reg  [7:0] servo_l,
    output reg  [7:0] servo_r
    );

reg [7:0] servo_l_nxt;
reg [7:0] servo_r_nxt;
reg [3:0] state,state_nxt;
reg [20:0] counter,counter_nxt;
reg [10:0] pid_buf;

localparam        
    idle              = 3'b000,
    turn_left         = 3'b001,
    turn_right        = 3'b010,
    stop              = 3'b111,
    servo_l_on        = 8'd157,
    servo_r_on        = 8'd137,
    servo_off         = 1'd0;
                                 
always @(posedge clk) begin
    if(rst) begin
        servo_l <=0;
        servo_r <=0;
        state   <=0;
        counter <=0;
        pid_buf <=0;
    end
    else begin
        servo_l <= servo_l_nxt;
        servo_r <= servo_r_nxt;
        state   <= state_nxt;
        counter <= counter_nxt;
        pid_buf <= pid_output;
    end
end

always @(*) begin
    servo_l_nxt = 0;
    servo_r_nxt = 0;
    counter_nxt = 0;
    case (state)
        idle: begin 
            counter_nxt=0;          
            if(pid_buf == 239) begin
                state_nxt =stop;
            end
            else if(pid_buf > 500) begin
                state_nxt=turn_left;
            end  
            else if(pid_buf < 500) begin
                state_nxt=turn_right;
            end
            else begin
                state_nxt=idle;
                servo_l_nxt = servo_l_on;
                servo_r_nxt = servo_r_on; 
            end    
        end      
        turn_right: begin
            counter_nxt=counter+1;
            servo_l_nxt = servo_l_on;
            servo_r_nxt =servo_off;
            if(counter >= pid_buf)
                state_nxt=idle;
            else
                state_nxt=turn_right;
        end
        turn_left: begin
            counter_nxt=counter+1;
            servo_l_nxt = servo_off;
            servo_r_nxt =servo_r_on;
            if(counter >= pid_buf - 500)
                state_nxt=idle;
            else
                state_nxt=turn_left;
        end
        stop: begin
            servo_l_nxt = servo_off;
            servo_r_nxt =servo_off;
            if(pid_buf == 239)
                state_nxt =stop;
            else 
                state_nxt=idle;
        end     
        default: state_nxt=idle;        
    endcase    
end
endmodule
