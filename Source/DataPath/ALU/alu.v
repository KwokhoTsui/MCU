`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ����: ���ļ�Ϊalu������ļ�
// ����Ϊ 2 �� 32 bit ������ 1 �� 3 bit �� alu_sle �źţ����Ϊ 32 bit �� alr_result �� 1-bit �� OF �źţ��ж��Ƿ�Ӽ����Ƿ����
// ��ģ��: 
// MUX_8_1:����Ϊ 8 �� 32 bit �Ľ���� 1 �� 3 bit �� sel �źţ����Ϊ alu �����
// alu_and:����Ϊ 2 �� 32 bit ���������Ϊ������λ��Ľ��
// alu_or:����λ 2 �� 32 bit ���������Ϊ������λ��Ľ��
// comparator: ����Ϊ 2 �� 32 bit ���������Ϊ 32 bit �Ĵ��ڱ�־λ�����һλΪ��־λ������λΪ0��
// booth_multiplier_16: ����Ϊ 2 �� 16 bit ���������Ϊ32bit��˺�Ľ��
// Additional Comments:
// ALU_sel = 000: ALU_result = Rand
// ALU_sel = 001: ALU_result = Ror
// ALU_sel = 010: ALU_result = Radd
// ALU_sel = 011: ALU_result = Rsll
// ALU_sel = 100: ALU_result = Rmul
// ALU_sel = 101: ALU_result = Rsrl
// ALU_sel = 110: ALU_result = Rsub
// ALU_sel = 111: ALU_result = Rslt
//////////////////////////////////////////////////////////////////////////////////


module alu(
   input [31:0] A,B,
   input [2:0] ALU_sel,
   output [31:0] ALU_result,
   output OF
   );
    
    wire [31:0] Rand, Ror, Radd,Rsub, Rsll, Rmul, Rsrl, Rslt;// 8�����ܵĽ��
    
    
    alu_and A_and(.a(A), .b(B), .Rand(Rand));
    alu_or A_or(.a(A), .b(B), .Ror(Ror));
    comparator A_com(.A(A), .B(B), .G(Rslt));
    carry_select_adder_32 A_add(.x(A), .y(B), .cin(0), .s(Radd), .cout(), .OF(OF));
    carry_select_adder_32 A_sub(.x(A), .y(~B), .cin(1), .s(Rsub), .cout(), .OF(OF));
    left_shift A_sll(.A(A), .B(B), .result(Rsll));
    right_shift A_srl(.A(A),.B(B),.result(Rsrl));
    booth_multiplier_16 A_mul(.real_x(A[15:0]), .real_y(B[15:0]), .product(Rmul));

    
    MUX_8_1 A_mux(.sel(ALU_sel), .in0(Rand), .in1(Ror), .in2(Radd), .in3(Rsll), .in4(Rmul), .in5(Rsrl), .in6(Rsub), .in7(Rslt), .R(ALU_result));
    
endmodule
