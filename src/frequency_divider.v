`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2021 17:35:17
// Design Name: 
// Module Name: frequency_divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module frequency_divider
    # ( parameter
        freq = 1000
    )
    (
        input  wire clk100MHz, // input clock 100 MHz
        input  wire rst,       // async reset active high
        output reg  clk_div    // output clock
    );

    // when the counter should restart from zero
    localparam LOOP_COUNTER_AT = 100_000_000 / freq / 2 ;
    
    reg [clog2(LOOP_COUNTER_AT)-1:0] count;

    always @( posedge(clk100MHz), posedge(rst) )
    begin

        if(rst)
        begin : counter_reset
            count   <= #1 0;
            clk_div <= #1 1'b0;
        end

        else
        begin : counter_operate

            if (count == (LOOP_COUNTER_AT - 1))
            begin : counter_loop
                count   <= #1 0;
                clk_div <= #1 ~clk_div;
            end

            else
            begin : counter_increment
                count   <= #1 count + 1;
                clk_div <= #1 clk_div;
            end

        end
    end

    // function to calculate number of bits necessary to store the number
    // (ceiling of base 2 logarithm)
    function integer clog2(input integer number);
        begin
            clog2 = 0;
            while (number)
            begin
                clog2  = clog2 + 1;
                number = number >> 1;
            end
        end
    endfunction
endmodule
