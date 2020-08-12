`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/04 12:11:39
// Design Name: 
// Module Name: MUL_16x1
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


module MUL_16x1(a,b,out);
input [15:0]a;
input b;
output [31:0]out;
assign out[0]=a[0]&b;
assign out[1]=a[1]&b;
assign out[2]=a[2]&b;
assign out[3]=a[3]&b;
assign out[4]=a[4]&b;
assign out[5]=a[5]&b;
assign out[6]=a[6]&b;
assign out[7]=a[7]&b;
assign out[8]=a[8]&b;
assign out[9]=a[9]&b;
assign out[10]=a[10]&b;
assign out[11]=a[11]&b;
assign out[12]=a[12]&b;
assign out[13]=a[13]&b;
assign out[14]=a[14]&b;
assign out[15]=a[15]&b;
assign out[31:16]=16'b0000000000000000;
endmodule
