`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/01 10:39:43
// Design Name: 
// Module Name: alu_decoder
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


module alu_decoder(funct,reset,AluOp,AluControl);
input [5:0]funct;
input reset;
input [3:0]AluOp;
output [2:0]AluControl;
reg [2:0]alu_funct;
assign AluControl=alu_funct;

always@(*)
begin
    if(!reset)begin
    alu_funct=3'b0;
    end
    else if(AluOp==4'b1111)begin
    case(funct)
    6'b100000:alu_funct=3'b010;//add
    6'b100010:alu_funct=3'b110;//sub
    6'b100100:alu_funct=3'b000;//and
    6'b100101:alu_funct=3'b001;//or
    6'b101010:alu_funct=3'b111;//slt
    6'b000000:alu_funct=3'b011;//sll
    6'b000010:alu_funct=3'b101;//srl
    6'b011000:alu_funct=3'b100;//mult
    endcase
    end
    else begin
    alu_funct=AluOp[2:0];
    end
end
endmodule
