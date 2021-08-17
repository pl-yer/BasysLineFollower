`timescale 1ns / 1ps

module PWM_test;

reg clk;
reg rst;
wire L;
wire R;
reg [10:0] servo_L,servo_R;

servo_to_PWM my_PWM(
.clk(clk),
.PWM_L(L),
.PWM_R(R),
.servo_L(servo_L),
.servo_R(servo_R)
);
initial begin 
rst=0;
clk=0;
#1750000;  // 2sec delay
rst =1;
#1000000;
rst=0;
end
always begin 
clk =0;
#5;
clk=1;
#5;
end
always begin
servo_L = 500;
servo_R= 250;
#50000000;
servo_L =  750;
servo_R=   500;
#50000000;
end
endmodule
