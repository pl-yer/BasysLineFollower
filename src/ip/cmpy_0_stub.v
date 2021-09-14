// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
// Date        : Tue Sep 14 21:12:57 2021
// Host        : LAPTOP-4I19V42J running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/rafal/Desktop/studia/UEC/line_follower/vivado/line_follower.srcs/sources_1/ip/cmpy_0/cmpy_0_stub.v
// Design      : cmpy_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "cmpy_v6_0_13,Vivado 2017.3" *)
module cmpy_0(aclk, s_axis_a_tvalid, s_axis_a_tdata, 
  s_axis_b_tvalid, s_axis_b_tdata, m_axis_dout_tvalid, m_axis_dout_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,s_axis_a_tvalid,s_axis_a_tdata[15:0],s_axis_b_tvalid,s_axis_b_tdata[15:0],m_axis_dout_tvalid,m_axis_dout_tdata[47:0]" */;
  input aclk;
  input s_axis_a_tvalid;
  input [15:0]s_axis_a_tdata;
  input s_axis_b_tvalid;
  input [15:0]s_axis_b_tdata;
  output m_axis_dout_tvalid;
  output [47:0]m_axis_dout_tdata;
endmodule
