module input_control (
 input wire a,
 input wire R_sensor,
 
 output reg [1:0]  sensors_signal,
 output reg [1:0] follower_state
 
);

always @ * begin
sensors_signal [0] <= a;
sensors_signal [1] <= R_sensor;
end

endmodule