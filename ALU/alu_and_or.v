`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
///描述：本文件为32位的与功能和或功能实现模块实现
// 子模块：
// alu_and: 32 bit 与功能
// alu_or: 32 bit 或功能
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


