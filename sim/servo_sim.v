timescale 1ns / 1ps

module draw_rect_ctl_test;

reg clk;
reg rst;

wire [11:0] mouse_xpos,mouse_ypos;
wire left;

wire [11:0] xpos,ypos;
wire [3:0] state;

draw_rect_ctl_tb my_draw_rect_ctl_tb(
   .left(left),
   .mouse_xpos(mouse_xpos),
   .mouse_ypos(mouse_ypos)
);

draw_rectangle_clt rect_test(
   .left(left),
   .mouse_xpos(mouse_xpos),
   .mouse_ypos(mouse_ypos),
  .clk(clk),
  .rst(rst),
   
   .xpos(xpos),
   .ypos(ypos),
   .state(state)
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
#6250000;
clk=1;
#6250000;
end
endmodule
