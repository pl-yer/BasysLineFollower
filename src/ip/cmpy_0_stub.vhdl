-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
-- Date        : Tue Sep 14 21:12:57 2021
-- Host        : LAPTOP-4I19V42J running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/rafal/Desktop/studia/UEC/line_follower/vivado/line_follower.srcs/sources_1/ip/cmpy_0/cmpy_0_stub.vhdl
-- Design      : cmpy_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cmpy_0 is
  Port ( 
    aclk : in STD_LOGIC;
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_b_tvalid : in STD_LOGIC;
    s_axis_b_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_dout_tvalid : out STD_LOGIC;
    m_axis_dout_tdata : out STD_LOGIC_VECTOR ( 47 downto 0 )
  );

end cmpy_0;

architecture stub of cmpy_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,s_axis_a_tvalid,s_axis_a_tdata[15:0],s_axis_b_tvalid,s_axis_b_tdata[15:0],m_axis_dout_tvalid,m_axis_dout_tdata[47:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "cmpy_v6_0_13,Vivado 2017.3";
begin
end;
