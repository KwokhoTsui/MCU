`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 描述: 本文件为alu的设计文件
// 输入为 2 个 32 bit 的数和 1 个 3 bit 的 alu_sle 信号，输出为 32 bit 的 alr_result 和 1-bit 的 OF 信号，判断是否加减法是否溢出
// 子模块: 
// MUX_8_1:输入为 8 个 32 bit 的结果和 1 个 3 bit 的 sel 信号，输出为 alu 最后结果
// alu_and:输入为 2 个 32 bit 的数，输出为两数按位与的结果
// alu_or:输入位 2 个 32 bit 的数，输出为两数按位或的结果
// comparator: 输入为 2 个 32 bit 的数，输出为 32 bit 的大于标志位（最后一位为标志位，其余位为0）
// ALU_Wallace_MUL: 输入为 2 个 16 bit 的数，输出为 16 bit 相乘后的结果
// Additional Comments:
// ALU_sel = 000: ALU_result = Rand
// ALU_sel = 001: ALU_result = Ror
// ALU_sel = 010: ALU_result = Radd
// ALU_sel = 011: ALU_result = Rsll
// ALU_sel = 100: ALU_result = Rmul
// ALU_sel = 101: ALU_result = Rsrl
// ALU_sel = 110: ALU_result = Rsub
// ALU_sel = 111: ALU_result = Rcom
//////////////////////////////////////////////////////////////////////////////////


module alu(
   input [31:0] A,B,
   input [2:0] ALU_sel,
   input [4:0]shamt,
   output [31:0] ALU_result,
   output OF
   );
    
    wire [31:0] Rand, Ror, Radd,Rsub, Rsll, Rmul, Rsrl, Rslt;// 8个功能的结果
    
    
    alu_and A_and(.a(A), .b(B), .Rand(Rand));
    alu_or A_or(.a(A), .b(B), .Ror(Ror));
    comparator A_com(.A(A), .B(B), .G(Rslt));
    carry_select_adder_32 A_add(.x(A), .y(B), .cin(0), .s(Radd), .cout(), .OF(OF));
    carry_select_adder_32 A_sub(.x(A), .y(~B), .cin(1), .s(Rsub), .cout(), .OF(OF));
    left_shift A_sll(.A(A), .shamt(shamt), .result(Rsll));
    right_shift A_srl(.A(A),.shamt(shamt),.result(Rsrl));
    ALU_Wallace_MUL A_mul(.A(A),.B(B),.mul_result(Rmul));

    
    MUX_8_1 A_mux(.sel(ALU_sel), .in0(Rand), .in1(Ror), .in2(Radd), .in3(Rsll), .in4(Rmul), .in5(Rsrl), .in6(Rsub), .in7(Rslt), .R(ALU_result));
    
endmodule
