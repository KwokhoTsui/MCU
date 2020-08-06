`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
本文件是ALU比较器模块设计文件
子模块：
comparator_1bit: 1bit比较模块
MUX_2： 2选1选择器，由上一位比较结果控制
注： 本设计算法思想源于超前进位加法器
*/
//////////////////////////////////////////////////////////////////////////////////


module comparator(A,B,G);
    input [31:0]A,B;
    output [31:0]G;//G是大于标志位
    
    wire cp_out0,cp_out1,cp_out2,cp_out3,cp_out4,cp_out5,cp_out6,cp_out7,cp_out8,cp_out9,cp_out10,cp_out11,cp_out12,cp_out13,cp_out14,cp_out15,cp_out16,cp_out17,cp_out18,cp_out19,cp_out20,cp_out21,cp_out22,cp_out23,cp_out24,cp_out25,cp_out26,cp_out27,cp_out28,cp_out29,cp_out30,cp_out31;
    wire mux_out0,mux_out1,mux_out2,mux_out3,mux_out4,mux_out5,mux_out6,mux_out7,mux_out8,mux_out9,mux_out10,mux_out11,mux_out12,mux_out13,mux_out14,mux_out15,mux_out16,mux_out17,mux_out18,mux_out19,mux_out20,mux_out21,mux_out22,mux_out23,mux_out24,mux_out25,mux_out26,mux_out27,mux_out28,mux_out29,mux_out30;
    
    comparator_1bit_highest cp31(.A(A[31]),.B(B[31]),.cp_out(cp_out31));
    comparator_1bit cp30(.A(A[30]),.B(B[30]),.cp_out(cp_out30));
    comparator_1bit cp29(.A(A[29]),.B(B[29]),.cp_out(cp_out29));
    comparator_1bit cp28(.A(A[28]),.B(B[28]),.cp_out(cp_out28));
    comparator_1bit cp27(.A(A[27]),.B(B[27]),.cp_out(cp_out27));
    comparator_1bit cp26(.A(A[26]),.B(B[26]),.cp_out(cp_out26));
    comparator_1bit cp25(.A(A[25]),.B(B[25]),.cp_out(cp_out25));
    comparator_1bit cp24(.A(A[24]),.B(B[24]),.cp_out(cp_out24));
    comparator_1bit cp23(.A(A[23]),.B(B[23]),.cp_out(cp_out23));
    comparator_1bit cp22(.A(A[22]),.B(B[22]),.cp_out(cp_out22));
    comparator_1bit cp21(.A(A[21]),.B(B[21]),.cp_out(cp_out21));
    comparator_1bit cp20(.A(A[20]),.B(B[20]),.cp_out(cp_out20));
    comparator_1bit cp19(.A(A[19]),.B(B[19]),.cp_out(cp_out19));
    comparator_1bit cp18(.A(A[18]),.B(B[18]),.cp_out(cp_out18));
    comparator_1bit cp17(.A(A[17]),.B(B[17]),.cp_out(cp_out17));
    comparator_1bit cp16(.A(A[16]),.B(B[16]),.cp_out(cp_out16));
    comparator_1bit cp15(.A(A[15]),.B(B[15]),.cp_out(cp_out15));
    comparator_1bit cp14(.A(A[14]),.B(B[14]),.cp_out(cp_out14));
    comparator_1bit cp13(.A(A[13]),.B(B[13]),.cp_out(cp_out13));
    comparator_1bit cp12(.A(A[12]),.B(B[12]),.cp_out(cp_out12));
    comparator_1bit cp11(.A(A[11]),.B(B[11]),.cp_out(cp_out11));
    comparator_1bit cp10(.A(A[10]),.B(B[10]),.cp_out(cp_out10));
    comparator_1bit cp9(.A(A[9]),.B(B[9]),.cp_out(cp_out9));
    comparator_1bit cp8(.A(A[8]),.B(B[8]),.cp_out(cp_out8));
    comparator_1bit cp7(.A(A[7]),.B(B[7]),.cp_out(cp_out7));
    comparator_1bit cp6(.A(A[6]),.B(B[6]),.cp_out(cp_out6));
    comparator_1bit cp5(.A(A[5]),.B(B[5]),.cp_out(cp_out5));
    comparator_1bit cp4(.A(A[4]),.B(B[4]),.cp_out(cp_out4));
    comparator_1bit cp3(.A(A[3]),.B(B[3]),.cp_out(cp_out3));
    comparator_1bit cp2(.A(A[2]),.B(B[2]),.cp_out(cp_out2));
    comparator_1bit cp1(.A(A[1]),.B(B[1]),.cp_out(cp_out1));
    comparator_1bit cp0(.A(A[0]),.B(B[0]),.cp_out(cp_out0));
    MUX_2 mux30(.a(cp_out30),.b(1'b1),.upper_out(cp_out31),.mux_out(mux_out30));
    MUX_2 mux29(.a(cp_out29),.b(1'b1),.upper_out(mux_out30),.mux_out(mux_out29));
    MUX_2 mux28(.a(cp_out28),.b(1'b1),.upper_out(mux_out29),.mux_out(mux_out28));
    MUX_2 mux27(.a(cp_out27),.b(1'b1),.upper_out(mux_out28),.mux_out(mux_out27));
    MUX_2 mux26(.a(cp_out26),.b(1'b1),.upper_out(mux_out27),.mux_out(mux_out26));
    MUX_2 mux25(.a(cp_out25),.b(1'b1),.upper_out(mux_out26),.mux_out(mux_out25));
    MUX_2 mux24(.a(cp_out24),.b(1'b1),.upper_out(mux_out25),.mux_out(mux_out24));
    MUX_2 mux23(.a(cp_out23),.b(1'b1),.upper_out(mux_out24),.mux_out(mux_out23));
    MUX_2 mux22(.a(cp_out22),.b(1'b1),.upper_out(mux_out23),.mux_out(mux_out22));
    MUX_2 mux21(.a(cp_out21),.b(1'b1),.upper_out(mux_out22),.mux_out(mux_out21));
    MUX_2 mux20(.a(cp_out20),.b(1'b1),.upper_out(mux_out21),.mux_out(mux_out20));
    MUX_2 mux19(.a(cp_out19),.b(1'b1),.upper_out(mux_out20),.mux_out(mux_out19));
    MUX_2 mux18(.a(cp_out18),.b(1'b1),.upper_out(mux_out19),.mux_out(mux_out18));
    MUX_2 mux17(.a(cp_out17),.b(1'b1),.upper_out(mux_out18),.mux_out(mux_out17));
    MUX_2 mux16(.a(cp_out16),.b(1'b1),.upper_out(mux_out17),.mux_out(mux_out16));
    MUX_2 mux15(.a(cp_out15),.b(1'b1),.upper_out(mux_out16),.mux_out(mux_out15));
    MUX_2 mux14(.a(cp_out14),.b(1'b1),.upper_out(mux_out15),.mux_out(mux_out14));
    MUX_2 mux13(.a(cp_out13),.b(1'b1),.upper_out(mux_out14),.mux_out(mux_out13));
    MUX_2 mux12(.a(cp_out12),.b(1'b1),.upper_out(mux_out13),.mux_out(mux_out12));
    MUX_2 mux11(.a(cp_out11),.b(1'b1),.upper_out(mux_out12),.mux_out(mux_out11));
    MUX_2 mux10(.a(cp_out10),.b(1'b1),.upper_out(mux_out11),.mux_out(mux_out10));
    MUX_2 mux9(.a(cp_out9),.b(1'b1),.upper_out(mux_out10),.mux_out(mux_out9));
    MUX_2 mux8(.a(cp_out8),.b(1'b1),.upper_out(mux_out9),.mux_out(mux_out8));
    MUX_2 mux7(.a(cp_out7),.b(1'b1),.upper_out(mux_out8),.mux_out(mux_out7));
    MUX_2 mux6(.a(cp_out6),.b(1'b1),.upper_out(mux_out7),.mux_out(mux_out6));
    MUX_2 mux5(.a(cp_out5),.b(1'b1),.upper_out(mux_out6),.mux_out(mux_out5));
    MUX_2 mux4(.a(cp_out4),.b(1'b1),.upper_out(mux_out5),.mux_out(mux_out4));
    MUX_2 mux3(.a(cp_out3),.b(1'b1),.upper_out(mux_out4),.mux_out(mux_out3));
    MUX_2 mux2(.a(cp_out2),.b(1'b1),.upper_out(mux_out3),.mux_out(mux_out2));
    MUX_2 mux1(.a(cp_out1),.b(1'b1),.upper_out(mux_out2),.mux_out(mux_out1));
    MUX_2 mux0(.a(cp_out0),.b(1'b1),.upper_out(mux_out1),.mux_out(mux_out0));
    assign G[0] =(mux_out0&~A[31])|(~mux_out0&A[31]&B[31]);
    assign G[31:8] = 24'h000000;
    assign G[7:1] = 7'b0000000;
endmodule
