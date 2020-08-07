`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/01 10:24:08
// Design Name: 
// Module Name: main_decoder
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


module main_decoder(op,reset,AluOp,RegWrite,MemtoReg,MemWrite,Branch,AluSrc,RegDst,Jump);
input [5:0]op;
input reset;
output RegWrite;
output RegDst;
output AluSrc;
output [1:0]Branch;
output [3:0]AluOp;
output MemWrite;
output MemtoReg;
output Jump;

reg [11:0]main;
assign {AluOp,RegWrite,RegDst,AluSrc,Branch,MemWrite,MemtoReg,Jump}=main;

always@(*)begin
    if(!reset)begin
    main<=11'b0;
    end
    else begin
        case(op)
        6'b000000:main=12'b1111_110_00000;//R_type
        //I_type
        6'b000010:main=12'b0000_000_00001;//j
        6'b000100:main=12'b0110_000_10000;//beq
        6'b000101:main=12'b0110_000_11000;//bne
        6'b001000:main=12'b1000_101_00000;//addi
        6'b001000:main=12'b0000_101_00000;//addiu
        6'b001010:main=12'b1111_101_00000;//slti
        6'b001100:main=12'b0000_101_00000;//andi
        6'b001101:main=12'b0001_101_00000;//ori
        6'b100011:main=12'b0000_101_00010;//lw
        6'b101011:main=12'b0000_001_00100;//sw
        default:main=12'b0;
        endcase
    end
end
endmodule
