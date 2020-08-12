`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
///���������ļ�Ϊ32λ���빦�ܺͻ���ʵ��ģ��ʵ��
// ��ģ�飺
// alu_and: 32 bit �빦��
// alu_or: 32 bit ����
//////////////////////////////////////////////////////////////////////////////////


module alu_and(

input [31:0] a,b,
output[31:0] Rand

    );

assign Rand = a & b;
    
endmodule

module alu_or(

input [31:0] a,b,
output[31:0] Ror

    );

assign Ror = a | b;
    
endmodule


