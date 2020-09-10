`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/09 12:31:51
// Design Name: 
// Module Name: sim1
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

module sim1();
reg clk;
reg reset;
five_stage_pipeline Y1(.reset(reset), .clk(clk));
initial
begin
reset=0;
#21 reset=1;
end

initial
begin
clk=0;
forever begin
#5 clk=~clk;
end
end

initial begin
#100000 $stop;
end
endmodule
