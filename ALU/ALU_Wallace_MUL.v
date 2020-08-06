`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
描述：本文件为16位华莱士树乘法器的模块实现
子模块：
MUX16x1：乘数的每一位与被乘数相乘
left shift: ALU左移模块
carry_select_adder_32: ALU32位加法器模块
complement: 补码模块
注：乘法器的输入已经限制为补码输入，即在ALU前端有求补码模块。
*/
//////////////////////////////////////////////////////////////////////////////////


module ALU_Wallace_MUL(A,B,mul_result);
input [15:0]A,B;//A被乘数，B乘数
output [31:0]mul_result;

wire [31:0]out;
wire [31:0]mul_result;
wire [31:0]aout0,bout0,cout0;
wire [31:0]aout1;
wire [31:0]aout2,bout1;
wire [31:0]aout3;
wire [31:0]aout4,bout2,cout1;
wire [31:0]aout5;
wire [31:0]aout6,bout3;
wire [31:0]aout7;

reg [31:0]temp0;
reg [31:0]temp1;
reg [31:0]temp2;
reg [31:0]temp3;
reg [31:0]temp4;
reg [31:0]temp5;
reg [31:0]temp6;
reg [31:0]temp7;
reg [31:0]temp8;
reg [31:0]temp9;
reg [31:0]temp10;
reg [31:0]temp11;
reg [31:0]temp12;
reg [31:0]temp13;
reg [31:0]temp14;
reg [31:0]temp15;
wire [15:0]out_l;

wire [31:0]temp_0,temp_1,temp_2,temp_3,temp_4,temp_5,temp_6,temp_7,temp_8,temp_9,temp_10,temp_11,temp_12,temp_13,temp_14,temp_15;
wire [31:0]out0_16x1,out1_16x1,out2_16x1,out3_16x1,out4_16x1,out5_16x1,out6_16x1,out7_16x1,out8_16x1,out9_16x1,out10_16x1,out11_16x1,out12_16x1,out13_16x1,out14_16x1,out15_16x1;

//complement Q1(.A(a),.a(A));
//complement Q2(.A(b),.a(B));


MUL_16x1 U0(.a(A),.b(B[0]),.out(out0_16x1));
MUL_16x1 U1(.a(A),.b(B[1]),.out(out1_16x1));
MUL_16x1 U2(.a(A),.b(B[2]),.out(out2_16x1));
MUL_16x1 U3(.a(A),.b(B[3]),.out(out3_16x1));
MUL_16x1 U4(.a(A),.b(B[4]),.out(out4_16x1));
MUL_16x1 U5(.a(A),.b(B[5]),.out(out5_16x1));
MUL_16x1 U6(.a(A),.b(B[6]),.out(out6_16x1));
MUL_16x1 U7(.a(A),.b(B[7]),.out(out7_16x1));
MUL_16x1 U8(.a(A),.b(B[8]),.out(out8_16x1));
MUL_16x1 U9(.a(A),.b(B[9]),.out(out9_16x1));
MUL_16x1 U10(.a(A),.b(B[10]),.out(out10_16x1));
MUL_16x1 U11(.a(A),.b(B[11]),.out(out11_16x1));
MUL_16x1 U12(.a(A),.b(B[12]),.out(out12_16x1));
MUL_16x1 U13(.a(A),.b(B[13]),.out(out13_16x1));
MUL_16x1 U14(.a(A),.b(B[14]),.out(out14_16x1));
MUL_16x1 U15(.a(A),.b(B[15]),.out(out15_16x1));

left_shift S0(.A(out0_16x1),.shamt(5'b0_0000),.result(temp_15));
left_shift S1(.A(out1_16x1),.shamt(5'b0_0001),.result(temp_14));
left_shift S2(.A(out2_16x1),.shamt(5'b0_0010),.result(temp_13));
left_shift S3(.A(out3_16x1),.shamt(5'b0_0011),.result(temp_12));
left_shift S4(.A(out4_16x1),.shamt(5'b0_0100),.result(temp_11));
left_shift S5(.A(out5_16x1),.shamt(5'b0_0101),.result(temp_10));
left_shift S6(.A(out6_16x1),.shamt(5'b0_0110),.result(temp_9));
left_shift S7(.A(out7_16x1),.shamt(5'b0_0111),.result(temp_8));
left_shift S8(.A(out8_16x1),.shamt(5'b0_1000),.result(temp_7));
left_shift S9(.A(out9_16x1),.shamt(5'b0_1001),.result(temp_6));
left_shift S10(.A(out10_16x1),.shamt(5'b0_1010),.result(temp_5));
left_shift S11(.A(out11_16x1),.shamt(5'b0_1011),.result(temp_4));
left_shift S12(.A(out12_16x1),.shamt(5'b0_1100),.result(temp_3));
left_shift S13(.A(out13_16x1),.shamt(5'b0_1101),.result(temp_2));
left_shift S14(.A(out14_16x1),.shamt(5'b0_1110),.result(temp_1));
left_shift S15(.A(out15_16x1),.shamt(5'b0_1111),.result(temp_0));

always@(*)
begin
temp0<=temp_0;
temp1<=temp_1;
temp2<=temp_2;
temp3<=temp_3;
temp4<=temp_4;
temp5<=temp_5;
temp6<=temp_6;
temp7<=temp_7;
temp8<=temp_8;
temp9<=temp_9;
temp10<=temp_10;
temp11<=temp_11;
temp12<=temp_12;
temp13<=temp_13;
temp14<=temp_14;
temp15<=temp_15;
end

carry_select_adder_32 A0(.x(temp0), .y(temp1), .cin(1'b0), .s(aout0), .cout(), .OF());
carry_select_adder_32 A1(.x(temp2), .y(temp3), .cin(1'b0), .s(aout1), .cout(), .OF());
carry_select_adder_32 A2(.x(temp4), .y(temp5), .cin(1'b0), .s(aout2), .cout(), .OF());
carry_select_adder_32 A3(.x(temp6), .y(temp7), .cin(1'b0), .s(aout3), .cout(), .OF());
carry_select_adder_32 A4(.x(temp8), .y(temp9), .cin(1'b0), .s(aout4), .cout(), .OF());
carry_select_adder_32 A5(.x(temp10), .y(temp11), .cin(1'b0), .s(aout5), .cout(), .OF());
carry_select_adder_32 A6(.x(temp12), .y(temp13), .cin(1'b0), .s(aout6), .cout(), .OF());
carry_select_adder_32 A7(.x(temp14), .y(temp15), .cin(1'b0), .s(aout7), .cout(), .OF());
carry_select_adder_32 B0(.x(aout0), .y(aout1), .cin(1'b0), .s(bout0), .cout(), .OF());
carry_select_adder_32 B1(.x(aout2), .y(aout3), .cin(1'b0), .s(bout1), .cout(), .OF());
carry_select_adder_32 B2(.x(aout4), .y(aout5), .cin(1'b0), .s(bout2), .cout(), .OF());
carry_select_adder_32 B3(.x(aout6), .y(aout7), .cin(1'b0), .s(bout3), .cout(), .OF());
carry_select_adder_32 C0(.x(bout0), .y(bout1), .cin(1'b0), .s(cout0), .cout(), .OF());
carry_select_adder_32 C1(.x(bout2), .y(bout3), .cin(1'b0), .s(cout1), .cout(), .OF());
carry_select_adder_32 D0(.x(cout0), .y(cout1), .cin(1'b0), .s(out), .cout(), .OF());

//complement X1(.A(out[15:0]),.a(mul_result));
//assign out_l[15:0]=out[15:0];
assign mul_result[14:0]=out[26:12];
assign mul_result[15]=A[15]^B[15];
assign mul_result[16]=mul_result[15];
assign mul_result[17]=mul_result[15];
assign mul_result[18]=mul_result[15];
assign mul_result[19]=mul_result[15];
assign mul_result[20]=mul_result[15];
assign mul_result[21]=mul_result[15];
assign mul_result[22]=mul_result[15];
assign mul_result[23]=mul_result[15];
assign mul_result[24]=mul_result[15];
assign mul_result[25]=mul_result[15];
assign mul_result[26]=mul_result[15];
assign mul_result[27]=mul_result[15];
assign mul_result[28]=mul_result[15];
assign mul_result[29]=mul_result[15];
assign mul_result[30]=mul_result[15];
assign mul_result[31]=mul_result[15];
endmodule
