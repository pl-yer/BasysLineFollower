set project line_follower
set top_module main
set target xc7a35tcpg236-1
set bitstream_file vivado/${project}.runs/impl_1/${top_module}.bit

proc usage {} {
    puts "usage: vivado -mode tcl -source [info script] -tclargs \[simulation/bitstream/program\]"
    exit 1
}

if {($argc != 1) || ([lindex $argv 0] ni {"simulation" "bitstream" "program"})} {
    usage
}



if {[lindex $argv 0] == "program"} {
    open_hw
    connect_hw_server
    current_hw_target [get_hw_targets *]
    open_hw_target
    current_hw_device [lindex [get_hw_devices] 0]
    refresh_hw_device -update_hw_probes false [lindex [get_hw_devices] 0]

    set_property PROBES.FILE {} [lindex [get_hw_devices] 0]
    set_property FULL_PROBES.FILE {} [lindex [get_hw_devices] 0]
    set_property PROGRAM.FILE ${bitstream_file} [lindex [get_hw_devices] 0]

    program_hw_devices [lindex [get_hw_devices] 0]
    refresh_hw_device [lindex [get_hw_devices] 0]
    
    exit
} else {
    file mkdir vivado
    create_project ${project} vivado -part ${target} -force
}

read_xdc {
    src/basys.xdc
}

read_verilog {
    src/main.v
    src/servo_handler.v
    src/servo_to_PWM.v
    src/frequency_divider.v
    src/pid.v
    src/sensor_handler.v
}
#read_vhdl {}

add_files -fileset sim_1 {
    sim/PWM_sim.v
    sim/tb_pid.v
}

set_property top ${top_module} [current_fileset]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

if {[lindex $argv 0] == "simulation"} {
    launch_simulation
    start_gui
} else {
	start_gui
    synth_design -rtl -name rtl_1 
    show_schematic [concat [get_cells] [get_ports]]
    write_schematic -force -format pdf rtl_schematic.pdf -orientation landscape -scope visible
	
    launch_runs synth_1 -jobs 8
    wait_on_run synth_1

    launch_runs impl_1 -to_step write_bitstream -jobs 8
    wait_on_run impl_1
}
