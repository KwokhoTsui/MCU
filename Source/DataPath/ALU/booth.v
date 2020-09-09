`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ����: ���ļ�Ϊ16-bit booth-Wallace������˷���ʵ��
// ��ģ��: 
// partial_product:�����3λ�ĳ���booth�������Ӧ�Ĳ��ֻ�������Ϊ18λ�ı�����x��x[17:16]���Ƿ�����չ����һ������λ��x[15]����3λ�ĳ���y��booth���룻���Ϊ18λ�Ĳ��ֻ�out��
// booth_multiplier_16��16λ��booth-Wallace�˷�������������16λ���������һ��32λ�˻�
//////////////////////////////////////////////////////////////////////////////////

module partial_product(x, y, out);
input [17:0] x;
input [2:0] y;
output [17:0] out;

wire [17:0] plus_1x, plus_2x, minus_1x, minus_2x;
wire [15:0] minux_x_16bit;

parameter zero = 18'b00_0000_0000_0000_0000;

assign plus_1x = x;
assign minus_1x = {{2{minux_x_16bit[15]}}, minux_x_16bit};//��16λ��-x������չ��18λ
assign plus_2x = {x[16:0], 1'b0};
assign minus_2x = {minus_1x[16:0], 1'b0};
complement_16 complement(.x(x[15:0]), .y(minux_x_16bit)); //18λ��x��ǰ��λ���Ƿ�����չ��������ȥ�������16λ�ģ����16λ��-x������չΪ18λ
MUX_8_1_18bits mux (.in0(zero), .in1(plus_1x), .in2(plus_1x), .in3(plus_2x), .in4(minus_2x), .in5(minus_1x), .in6(minus_1x), .in7(zero), .sel(y), .R(out));
endmodule


module booth_multiplier_16(real_x, real_y, product);
input [15:0] real_x, real_y;
output [32:0] product;

wire [17:0] x;
wire [18:0] y;
wire [17:0]pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8;
/*************************************��չx��y************************************/
assign x = {{2{real_x[15]}}, real_x};
assign y = {{2{real_y[15]}}, real_y, 1'b0};//y��ĩβ��һλ0����booth����������y[-1]��
/**********************************����9�����ֻ�**********************************/
partial_product p0(.x(x), .y(y[2:0]), .out(pp0));
partial_product p1(.x(x), .y(y[4:2]), .out(pp1));
partial_product p2(.x(x), .y(y[6:4]), .out(pp2));
partial_product p3(.x(x), .y(y[8:6]), .out(pp3));
partial_product p4(.x(x), .y(y[10:8]), .out(pp4));
partial_product p5(.x(x), .y(y[12:10]), .out(pp5));
partial_product p6(.x(x), .y(y[14:12]), .out(pp6));
partial_product p7(.x(x), .y(y[16:14]), .out(pp7));
partial_product p8(.x(x), .y(y[18:16]), .out(pp8));
/*************************************�������ճ˻�*********************************/
/**************��һ��_1**************/
//��PP0-PP3�ĸ����ֻ�ֱ�Ӽ�����
wire [24:0] ex_pp0, ex_pp1, ex_pp2, ex_pp3, sum_11, carry_11;
assign ex_pp0 = {{7{pp0[17]}}, pp0};
assign ex_pp1 = {{5{pp1[17]}}, pp1, 2'b00};
assign ex_pp2 = {{3{pp2[17]}}, pp2, 4'b0000};
assign ex_pp3 = {pp3[17], pp3, 6'b00_0000};
compressor4_2_25 compressor1_1(.x0(ex_pp0), .x1(ex_pp1), .x2(ex_pp2), .x3(ex_pp3), .cout(), .carry(carry_11), .sum(sum_11));
/**************��һ��_2**************/
//��PP4-PP7�ĸ����ֻ�ֱ�Ӽ�������PP8�ȷ��ŵ���һ��
wire [23:0] ex_pp4, ex_pp5, ex_pp6, ex_pp7, sum_12, carry_12;
assign ex_pp4 = {{6{pp4[17]}}, pp4};
assign ex_pp5 = {{4{pp5[17]}}, pp5, 2'b00};
assign ex_pp6 = {{2{pp6[17]}}, pp6, 4'b0000};
assign ex_pp7 = {pp7, 6'b00_0000};
compressor4_2_24 compressor1_2(.x0(ex_pp4), .x1(ex_pp5), .x2(ex_pp6), .x3(ex_pp7), .cout(), .carry(carry_12), .sum(sum_12));
/**************�ڶ���_1**************/
//����һ�������ݡ���λ�͵ڶ��������ݡ���λ�ӵ�һ��PP8�ٷŵ���һ��
wire[31:0] ex_sum_11, ex_carry_11, ex_sum_12, ex_carry_12, sum_21, carry_21;
assign ex_sum_11 = {{7{sum_11[24]}}, sum_11};
assign ex_carry_11 = {{6{carry_11[24]}}, carry_11, 1'b0};
assign ex_sum_12 = {sum_12[23:0], 8'b0000_0000};
assign ex_carry_12 = {carry_12[22:0], 9'b0_0000_0000};
compressor4_2_32 compressor2_1(.x0(ex_sum_11), .x1(ex_carry_11), .x2(ex_sum_12), .x3(ex_carry_12), .cout(), .carry(carry_21), .sum(sum_21));
/**************������_1**************/
wire[31:0] ex_sum_21, ex_carry_21, ex_pp8, sum_31, carry_31;
assign ex_sum_21 = sum_21;
assign ex_carry_21 = {carry_21[30:0], 1'b0};
assign ex_pp8 = {pp8[15:0], 16'b0000_0000_0000_0000};
compressor3_2_32 compressor3_1(.x0(ex_sum_21), .x1(ex_carry_21), .x2(ex_pp8), .carry(carry_31), .sum(sum_31));
/**************���ļ�_ȫ����**************/
wire[31:0] ex_sum_31, ex_carry_31;
assign ex_sum_31 = sum_31;
assign ex_carry_31 = {carry_31[30:0], 1'b0};
carry_select_adder_32 FULL_ADDER(.x(ex_sum_31), .y(ex_carry_31), .cin(1'b0), .s(product), .cout(), .OF());
endmodule