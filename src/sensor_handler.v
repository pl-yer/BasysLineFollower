`timescale 1ns / 1ps

module sensor_handler(
    input wire clk,
    input wire rst,
    input wire [3:0] sensors,
    output reg [10:0] position
    );

reg [10:0] position_nxt;

always @(posedge clk) begin
    if(rst)
        position <= 0;
    else 
        position <= position_nxt;
end

always @(*) begin
    case(sensors)
    // 4'b1001:    position_nxt = 3000;
    // 4'b0111:    position_nxt = 6000;
    // 4'b0011:    position_nxt = 4500;
    // 4'b1110:    position_nxt = 1;
    // 4'b1100:    position_nxt = 1500;
    // 4'b1011:    position_nxt = 3750;
    // 4'b1101:    position_nxt = 2250;
    // 4'b0001:    position_nxt = 4000;
    // 4'b1000:    position_nxt = 2000;
    // default:    position_nxt = 8191;   // error case
    4'b1001:    position_nxt = 500;
    4'b0111:    position_nxt = 1000;
    4'b0011:    position_nxt = 750;
    4'b1110:    position_nxt = 1;
    4'b1100:    position_nxt = 250;
    4'b1011:    position_nxt = 625;
    4'b1101:    position_nxt = 375;
    4'b0001:    position_nxt = 666;
    4'b1000:    position_nxt = 333;
    default:    position_nxt = 1023;   // error case        
endcase
end
    
endmodule