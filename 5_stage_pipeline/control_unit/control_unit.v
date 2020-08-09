`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/01 10:07:02
// Design Name: 
// Module Name: control_unit
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


module Control_Unit(op,funct,reset,MemtoReg,RegDst,MemWrite,AluControl,AluSrc,Branch,RegWrite,Jump);
input reset;
input [5:0]op;
input [5:0]funct;
output MemtoReg;
output RegDst;
output MemWrite;
output [2:0]AluControl;
output AluSrc;
output RegWrite;
output Branch;
output Jump;
wire [3:0]AluOp;

main_decoder MD1(.op(op),.reset(reset),.AluOp(AluOp),.RegWrite(RegWrite),.MemtoReg(MemtoReg),.MemWrite(MemWrite),.Branch(Branch),.AluSrc(AluSrc),.RegDst(RegDst),.Jump(Jump));

alu_decoder AD1(.funct(funct),.reset(reset),.AluOp(AluOp),.AluControl(AluControl));
endmodule
