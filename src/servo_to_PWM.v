`timescale 1ns / 1ps

// updating PWM only every 20ms time interval 
module servo_to_PWM(
   input wire clk,
   input wire rst,
   input wire [7:0] servo_L,
   input wire [7:0] servo_R,
   output reg PWM_L,
   output reg PWM_R
   );
reg PWM_L_nxt;
reg PWM_R_nxt;
reg [19:0] counter,counter_nxt;
wire [47:0] servo_l_mul,servo_r_mul;
reg [7:0] servo_L_buf, servo_R_buf;
wire [15:0] multiplayer = 1000;

cmpy_0 my_cmpy(
.aclk(clk),
.s_axis_a_tvalid(1),
.s_axis_b_tvalid(1),
.s_axis_a_tdata(multiplayer),
.s_axis_b_tdata(servo_L),
.m_axis_dout_tdata(servo_l_mul)

);
cmpy_0 my_cmpy1(
.aclk(clk),
.s_axis_a_tvalid(1),
.s_axis_b_tvalid(1),
.s_axis_a_tdata(multiplayer),
.s_axis_b_tdata(servo_R),
.m_axis_dout_tdata(servo_r_mul)


);
always@ (posedge clk) begin
  if(rst) begin
  counter <=0;
  PWM_L   <=0;
  PWM_R   <=0;
  end
  else begin
  counter <=counter_nxt;
  PWM_L   <=PWM_L_nxt;
  PWM_R   <=PWM_R_nxt;
  end
  end 
    
always @* begin
     // servo_l_mul =servo_L *1000;
    //  servo_r_mul =servo_R *1000;
      counter_nxt = counter+1;
      if(counter > 1000000) begin
         counter_nxt=0;
      end
      if(counter > servo_l_mul) begin
      PWM_L_nxt=0;
      end
      else begin
      PWM_L_nxt =1;
      end
      if(counter >servo_r_mul) begin
         PWM_R_nxt=0;
      end
      else begin
         PWM_R_nxt =1;
      end
   end 
endmodule
