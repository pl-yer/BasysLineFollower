## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Switches
set_property PACKAGE_PIN V17 [get_ports {sw[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property PACKAGE_PIN V16 [get_ports {sw[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property PACKAGE_PIN W16 [get_ports {sw[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]

##Buttons
set_property PACKAGE_PIN T17 [get_ports rst]						
	set_property IOSTANDARD LVCMOS33 [get_ports rst]

##Pmod Header JA
#Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports {sensor[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sensor[0]}]
#Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports {sensor[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sensor[1]}]
#Sch name = JA3
set_property PACKAGE_PIN J2 [get_ports {sensor[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sensor[2]}]
#Sch name = JA4
set_property PACKAGE_PIN G2 [get_ports {sensor[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sensor[3]}]

##Pmod Header JXADC
#Sch name = XA1_P
set_property PACKAGE_PIN J3 [get_ports {servo[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {servo[0]}]
#Sch name = XA2_P
set_property PACKAGE_PIN L3 [get_ports {servo[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {servo[1]}]

 set_property CFGBVS VCCO [current_design]
 #where value1 is either VCCO or GND

 set_property CONFIG_VOLTAGE 3.3 [current_design]
 #where value2 is the voltage provided to configuration bank 0 
