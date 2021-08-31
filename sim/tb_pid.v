`timescale 1 ns / 1 ps

module tb_pid;

  reg clk;
  reg rst, kp_sw, ki_sw, kd_sw;
  reg [3:0] ir_sensors;
  wire [12:0] pid_output;
  
  pid  my_pid (
    .clk(clk),
    .rst(rst),
    .kp_sw(kp_sw),
    .ki_sw(ki_sw),
    .kd_sw(kd_sw),
    .sensors(ir_sensors),
    .pid_output(pid_output)
  );

  always
  begin
    clk = 1'b0;
    #5;
    clk = 1'b1;
    #5;
  end

  initial
  begin
    kp_sw = 1;
    ki_sw = 1;
    kd_sw = 1;
    ir_sensors = 4'b1001;
    // Reset check
    rst = 0;
    #2000;
    rst = 1;
    #1000
    rst = 0;
    #1000

    // Test sequence 
    ir_sensors = 4'b0011;
    #1000
    ir_sensors = 4'b0111;
    #500
    ir_sensors = 4'b1001;
    #500
    ir_sensors = 4'b1110;
    #1000
    ir_sensors = 4'b1100;
    #500
    ir_sensors = 4'b1111;
    #500
    ir_sensors = 4'b1101;
    #500
    ir_sensors = 4'b0000;
    #100
    ir_sensors = 4'b1001;
    
    $display("Simulation is over, check the waveforms.");
    $stop;
  end

endmodule
