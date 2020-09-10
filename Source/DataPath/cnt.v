`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/07 15:53:54
// Design Name: 
// Module Name: cnt
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


module cnt(reset,clk,data_mem,cnt);
input reset,clk;
input [31:0]data_mem;
output [31:0]cnt;

integer i=0;
always@(posedge clk or negedge reset)
if(!reset)begin
i=0;
end
else begin
i=i+1;
end

assign cnt = i;
endmodule
