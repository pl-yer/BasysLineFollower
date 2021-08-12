module input_control (
 input wire a,
 input wire R_sensor,
 
 output reg [1:0]  sensors_state
 
);

always @ * begin
sensors_state [0] <= a;
sensors_state [1] <= R_sensor;
end

endmodule