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
reg [3:0] state,state_nxt;
reg[20:0] counter,counter_nxt;

 localparam        
 idle         =   3'b000,
 turn_left    =   3'b001,
 turn_right   =   3'b010,
 stop         =   3'b111;
                                 
always @(posedge clk) begin
    if(rst) begin
     servo_l <=0;
     servo_r <=0;
     state   <=0;
     counter <=0;
    end
    else begin
    servo_l <= servo_l_nxt;
    servo_r <= servo_r_nxt;
    state   <= state_nxt;
    counter <= counter_nxt;
    end
end

always @(*) begin

case (state)
       idle:begin 
       counter_nxt=0;          
           if(sensors==0) begin
           state_nxt =stop;
        end
        else if(sensors==2) begin
          state_nxt=turn_left;
         end  
         else if(sensors==1) begin
           state_nxt=turn_right;
          end
          else begin
          state_nxt=idle;
          servo_l_nxt = 155;
          servo_r_nxt = 137; 
          end
             
       end      
       turn_right:begin
           counter_nxt=counter+1;
           servo_l_nxt = 155;
           servo_r_nxt =0;
           if(counter ==500) begin
               state_nxt=idle;
           end
           else begin
               state_nxt=turn_right;
           end
           end
       turn_left:begin
           counter_nxt=counter+1;
           servo_l_nxt = 0;
           servo_r_nxt =137;
           if(counter ==500) begin
                    state_nxt=idle;
           end
           else begin
                    state_nxt=turn_left;
           end
           end
       stop:begin
                  servo_l_nxt = 0;
                  servo_r_nxt =0;
                  if(sensors !=0) begin
                  state_nxt =idle;
                  end
                  else begin
                  state_nxt=stop;
                  end
                  end     
       default: begin
        state_nxt=idle;
        end        
    endcase    
end
endmodule
