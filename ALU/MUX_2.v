`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/28 09:49:59
// Design Name: 
// Module Name: MUX_2
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


module MUX_2(
a,b,upper_out,mux_out
    );
    input a,b,upper_out;//a是下一bit的比较结果，b是1；
    output mux_out;
    wire a,b,upper_out;
    wire mux_out;
    assign b=1'b1;
    assign mux_out=(a | upper_out);
endmodule
