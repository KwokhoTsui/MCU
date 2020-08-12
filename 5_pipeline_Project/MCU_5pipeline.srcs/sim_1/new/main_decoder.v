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
output Branch;
output [3:0]AluOp;
output MemWrite;
output MemtoReg;
output Jump;

reg [10:0]main;
assign {AluOp,RegWrite,RegDst,AluSrc,Branch,MemWrite,MemtoReg,Jump}=main;

always@(*)begin
    if(!reset)begin
    main<=11'b0;
    end
    else begin
        case(op)
        6'b000000:main=11'b1111_110_0000;//R_type
        //I_type
        6'b000010:main=11'b0000_000_0001;//j
        6'b000100:main=11'b0110_000_0000;//beq
        6'b000101:main=11'b0110_000_1000;//bne
        6'b001000:main=11'b1000_101_0000;//addi
        6'b001000:main=11'b0000_101_0000;//addiu
        6'b001010:main=11'b1111_101_0000;//slti
        6'b001100:main=11'b0000_101_0000;//andi
        6'b001101:main=11'b0001_101_0000;//ori
        6'b100011:main=11'b0010_101_0010;//lw
        6'b101011:main=11'b0010_001_0100;//sw
        default:main=11'b0;
        endcase
    end
end
endmodule
