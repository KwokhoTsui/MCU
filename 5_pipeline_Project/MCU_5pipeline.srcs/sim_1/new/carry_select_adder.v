`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 描述：本文件为32位的进位选择加法器的模块实现
// 子模块：
// MUX2_1: 2选1MUX
// FA：1bit全加器（基于异或和MUX）
// BEC_n： n位的加一器（输出位等于输入加1，模块结构决定了输入不可能全为1）
// CLA_n： n位的先行进位加法器
// carry_select_adder_16： 16位的进位选择加法器
// carry_select_adder_32： 32位的进位选择加法器
//////////////////////////////////////////////////////////////////////////////////
module MUX2_1(opt0, opt1, ctrl, y);
input opt0, opt1, ctrl;
output y;
assign y = (opt1 & ctrl) | (opt0 & ~ctrl);
endmodule


module FA(x, y, s, cin, cout);
input x, y, cin;
output s, cout;
assign s = x ^ y ^ cin;
MUX2_1 mux(.opt0(y), .opt1(cin), .ctrl(x ^ y), .y(cout));
endmodule


module BEC_3(x, y);
input [2:0] x;
output [2:0] y;
assign y[0] = ~x[0];
assign y[1] = x[1] ^ x[0];
assign y[2] = (x[1] & x[0]) ^ x[2];
endmodule


module BEC_4(x, y);
input [3:0] x;
output [3:0] y;
assign y[0] = ~x[0];
assign y[1] = x[1] ^ x[0];
assign y[2] = (x[1] & x[0]) ^ x[2];
assign y[3] = (x[2] & x[1] & x[0]) ^ x[3];
endmodule


module BEC_5(x, y);
input [4:0] x;
output [4:0] y;
assign y[0] = ~x[0];
assign y[1] = x[1] ^ x[0];
assign y[2] = (x[1] & x[0]) ^ x[2];
assign y[3] = (x[2] & x[1] & x[0]) ^ x[3];
assign y[4] = (x[3] & x[2] & x[1] & x[0]) ^ x[4];
endmodule


module BEC_6(x, y);
input [5:0] x;
output [5:0] y;
assign y[0] = ~x[0];
assign y[1] = x[1] ^ x[0];
assign y[2] = (x[1] & x[0]) ^ x[2];
assign y[3] = (x[2] & x[1] & x[0]) ^ x[3];
assign y[4] = (x[3] & x[2] & x[1] & x[0]) ^ x[4];
assign y[5] = (x[4] & x[3] & x[2] & x[1] & x[0]) ^ x[5];
endmodule


module CLA_2(x, y, s, cin, cout);
input [1:0] x, y;
input cin;
output [1:0] s;
output cout;
wire [1:0] G, P;
wire [2:0] C;
assign C[0] = cin;
assign G = x & y;
assign P = x ^ y;
assign C[1] = G[0] | (P[0] & C[0]);
assign C[2] = G[1] | (P[1] & (G[0] | (P[0] & C[0])));
assign s = x ^ y ^ C[1:0];
assign cout = C[2];
endmodule


module CLA_3(x, y, s, cin, cout);
input [2:0] x, y;
input cin;
output [2:0] s;
output cout;
wire [2:0] G, P;
wire [3:0] C;
assign C[0] = cin;
assign G = x & y;
assign P = x ^ y;
assign C[1] = G[0] | (P[0] & C[0]);
assign C[2] = G[1] | (P[1] & (G[0] | (P[0] & C[0])));
assign C[3] = G[2] | (P[2] & (G[1] | (P[1] & (G[0] | (P[0] & C[0])))));
assign s = x ^ y ^ C[2:0];
assign cout = C[3];
endmodule


module CLA_4(x, y, s, cin, cout);
input [3:0] x, y;
input cin;
output [3:0] s;
output cout;
wire [3:0] G, P;
wire [4:0] C;
assign C[0] = cin;
assign G = x & y;
assign P = x ^ y;
assign C[1] = G[0] | (P[0] & C[0]);
assign C[2] = G[1] | (P[1] & (G[0] | (P[0] & C[0])));
assign C[3] = G[2] | (P[2] & (G[1] | (P[1] & (G[0] | (P[0] & C[0])))));
assign C[4] = G[3] | (P[3] & (G[2] | (P[2] & (G[1] | (P[1] & (G[0] | (P[0] & C[0])))))));
assign s = x ^ y ^ C[3:0];
assign cout = C[4];
endmodule


module CLA_5(x, y, s, cin, cout, OF);
input [4:0] x, y;
input cin;
output [4:0] s;
output cout, OF;
wire [4:0] G, P;
wire [5:0] C;
assign C[0] = cin;
assign G = x & y;
assign P = x ^ y;
assign C[1] = G[0] | (P[0] & C[0]);
assign C[2] = G[1] | (P[1] & (G[0] | (P[0] & C[0])));
assign C[3] = G[2] | (P[2] & (G[1] | (P[1] & (G[0] | (P[0] & C[0])))));
assign C[4] = G[3] | (P[3] & (G[2] | (P[2] & (G[1] | (P[1] & (G[0] | (P[0] & C[0])))))));
assign C[5] = G[4] | (P[4] & (G[3] | (P[3] & (G[2] | (P[2] & (G[1] | (P[1] & (G[0] | (P[0] & C[0])))))))));
assign s = x ^ y ^ C[4:0];
assign cout = C[5];
assign OF = C[5] ^ C[4];
endmodule


module carry_select_adder_16(x, y, cin, s, cout, OF);
input [15:0] x, y;
input cin;
output [15:0] s;
output cout, OF;
wire [4:0] carrys; //每个CLA的进位输出，共五个部分
wire [4:0] select; //每个部分的选择信号，共五个部分
wire [15:0] cla_sum;//存储CLA的结果
wire [17:0] bec_out;//存储BEC的结果

CLA_2 cla1(.x(x[1:0]), .y(y[1:0]), .s(cla_sum[1:0]), .cin(cin), .cout(carrys[0]));
assign s[1:0] = cla_sum[1:0];
assign select[0] = carrys[0];

CLA_2 cla2(.x(x[3:2]), .y(y[3:2]), .s(cla_sum[3:2]), .cin(0), .cout(carrys[1]));//得到CLA结果
BEC_3 bec2(.x({carrys[1], cla_sum[3:2]}), .y(bec_out[2:0]));//CLA结果加一后的结果
MUX2_1 mux2_1(.opt0(cla_sum[2]), .opt1(bec_out[0]), .ctrl(select[0]), .y(s[2]));//通过mux，选择cla_sum或着bec_out作为结果
MUX2_1 mux2_2(.opt0(cla_sum[3]), .opt1(bec_out[1]), .ctrl(select[0]), .y(s[3]));//通过mux，选择择cla_sum或着bec_out作为结果
MUX2_1 mux2_3(.opt0(carrys[1]), .opt1(bec_out[2]), .ctrl(select[0]), .y(select[1]));//生成下一部分的选择信号

CLA_3 cla3(.x(x[6:4]), .y(y[6:4]), .s(cla_sum[6:4]), .cin(0), .cout(carrys[2]));
BEC_4 bec3(.x({carrys[2], cla_sum[6:4]}), .y(bec_out[6:3]));
MUX2_1 mux3_1(.opt0(cla_sum[4]), .opt1(bec_out[3]), .ctrl(select[1]), .y(s[4]));
MUX2_1 mux3_2(.opt0(cla_sum[5]), .opt1(bec_out[4]), .ctrl(select[1]), .y(s[5]));
MUX2_1 mux3_3(.opt0(cla_sum[6]), .opt1(bec_out[5]), .ctrl(select[1]), .y(s[6]));
MUX2_1 mux3_4(.opt0(carrys[2]), .opt1(bec_out[6]), .ctrl(select[1]), .y(select[2]));

CLA_4 cla4(.x(x[10:7]), .y(y[10:7]), .s(cla_sum[10:7]), .cin(0), .cout(carrys[3]));
BEC_5 bec4(.x({carrys[3], cla_sum[10:7]}), .y(bec_out[11:7]));
MUX2_1 mux4_1(.opt0(cla_sum[7]), .opt1(bec_out[7]), .ctrl(select[2]), .y(s[7]));
MUX2_1 mux4_2(.opt0(cla_sum[8]), .opt1(bec_out[8]), .ctrl(select[2]), .y(s[8]));
MUX2_1 mux4_3(.opt0(cla_sum[9]), .opt1(bec_out[9]), .ctrl(select[2]), .y(s[9]));
MUX2_1 mux4_4(.opt0(cla_sum[10]), .opt1(bec_out[10]), .ctrl(select[2]), .y(s[10]));
MUX2_1 mux4_5(.opt0(carrys[3]), .opt1(bec_out[11]), .ctrl(select[2]), .y(select[3]));

CLA_5 cla5(.x(x[15:11]), .y(y[15:11]), .s(cla_sum[15:11]), .cin(0), .cout(carrys[4]), .OF(OF));
BEC_6 bec5(.x({carrys[4], cla_sum[15:11]}), .y(bec_out[17:12]));
MUX2_1 mux5_1(.opt0(cla_sum[11]), .opt1(bec_out[12]), .ctrl(select[3]), .y(s[11]));
MUX2_1 mux5_2(.opt0(cla_sum[12]), .opt1(bec_out[13]), .ctrl(select[3]), .y(s[12]));
MUX2_1 mux5_3(.opt0(cla_sum[13]), .opt1(bec_out[14]), .ctrl(select[3]), .y(s[13]));
MUX2_1 mux5_4(.opt0(cla_sum[14]), .opt1(bec_out[15]), .ctrl(select[3]), .y(s[14]));
MUX2_1 mux5_5(.opt0(cla_sum[15]), .opt1(bec_out[16]), .ctrl(select[3]), .y(s[15]));
MUX2_1 mux5_6(.opt0(carrys[4]), .opt1(bec_out[17]), .ctrl(select[3]), .y(select[4]));

assign cout = select[4];
endmodule


module carry_select_adder_32(x, y, cin, s, cout, OF);
input [31:0] x, y;
input cin;
output [31:0] s;
output cout, OF;
wire carry_from_CSA16;
//将两个16位的CSA串联
carry_select_adder_16 adder1(.x(x[15:0]), .y(y[15:0]), .cin(cin), .s(s[15:0]), .cout(carry_from_CSA16), .OF());
carry_select_adder_16 adder2(.x(x[31:16]), .y(y[31:16]), .cin(carry_from_CSA16), .s(s[31:16]), .cout(cout), .OF(OF));
endmodule
