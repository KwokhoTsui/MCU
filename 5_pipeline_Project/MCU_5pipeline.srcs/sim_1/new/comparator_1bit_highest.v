`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/15 17:02:11
// Design Name: 
// Module Name: comparator_1bit_highest
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


module comparator_1bit_highest(
A,B,cp_out
    );
    input A,B;
    output cp_out;
    wire A,B;
    wire cp_out;
    assign cp_out = ~A&B;
endmodule
