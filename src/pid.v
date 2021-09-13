`timescale 1ns / 1ps

module pid(
    input wire clk,
    input wire rst,
    input wire [10:0] position,
    input wire kp_sw, ki_sw, kd_sw, // determines if p, i and d will be calculated
    output reg [10:0] pid_output
    );

reg [10:0] position_prev;
reg signed [10:0] error, error_nxt, error_sum, error_sum_nxt, error_dif, error_dif_nxt, error_prev;
reg signed [12:0] p, p_nxt, i, i_nxt, d, d_nxt;
reg signed [10:0] output_loaded_nxt, output_buf, output_buf_nxt;

localparam  
    K_P      = 1,
    K_P_DEN  = 2,
    K_I      = 5,
    K_I_DEN  = 100,
    K_D      = 1,
    K_D_DEN  = 200,
    TIME_DIV = 100,
    
    BASE_SPEED = 1;

always @(posedge clk) begin
    if(rst) begin
        position_prev <= 0;
        error         <= 0;
        error_sum     <= 0;
        error_dif     <= 0;
        error_prev    <= 0;
        p             <= 0;
        i             <= 0;
        d             <= 0;
        output_buf    <= 0;
        pid_output    <= 0;
    end
    else begin 
        position_prev <= position;
        error         <= error_nxt;
        error_sum     <= error_sum_nxt;
        error_dif     <= error_dif_nxt;
        error_prev    <= error;
        p             <= p_nxt;
        i             <= i_nxt;
        d             <= d_nxt;
        output_buf    <= output_buf_nxt;
        pid_output    <= output_loaded_nxt;
    end
end


always @(*) begin
    error_nxt = 500 - position;
    error_sum_nxt = (error == 0) ? 0 : (error_sum + error);
    error_dif_nxt = error - error_prev;
    
    p_nxt = kp_sw ? (K_P * error)/K_P_DEN : 0;
    i_nxt = ki_sw ? (K_I * error_sum)/(TIME_DIV * K_I_DEN) : 0;
    d_nxt = kd_sw ? (K_D * error_dif * TIME_DIV)/K_D_DEN : 0;

    output_buf_nxt = p + i + d + 500;
    if(output_buf < 0) output_loaded_nxt = 0;
    else if(output_buf > 1000) output_loaded_nxt = 0;
    else output_loaded_nxt = output_buf;
end
    
endmodule