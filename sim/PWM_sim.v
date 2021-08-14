`timescale 1ns / 1ps

module PWM_test;

reg clk;
reg rst;
wire L;
wire R;

servo_to_PWM my_PWM(
.clk(clk),
.PWM_L(L),
.PWM_R(R)
);
initial begin 
rst=0;
clk=0;
#1750000000;  // 2sec delay
rst =1;
#100000000;
rst=0;
end
always begin 
clk =0;
#5;
clk=1;
#5;
end
endmodule
