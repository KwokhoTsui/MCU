`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
本文件是ALU "set on less than"模块设计文件
子模块:
comparator：接收两个32bit的数A, B，若A < B，输出1；否则输出0.
*/
//////////////////////////////////////////////////////////////////////////////////


module comparator(A, B, result);
input [31:0]A,B;
output [31:0]result;

wire [31:0] XNOR, Min_01;
wire [31:0] z; //中间变量

assign XNOR = ~(A ^ B);
assign Min_01 = ~A & B;

assign z[31] = (A[31] & ~B[31]);
assign z[30] = (XNOR[31] & Min_01[30]);
assign z[29] = (XNOR[31] & XNOR[30] & Min_01[29]);
assign z[28] = (XNOR[31] & XNOR[30] & XNOR[29] & Min_01[28]);
assign z[27] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & Min_01[27]);
assign z[26] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & Min_01[26]);
assign z[25] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & Min_01[25]);
assign z[24] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & Min_01[24]);
assign z[23] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & Min_01[23]);
assign z[22] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & Min_01[22]);
assign z[21] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] & Min_01[21]);
assign z[20] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & Min_01[20]);
assign z[19] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & Min_01[19]);
assign z[18] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & Min_01[18]);
assign z[17] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & XNOR[18] & Min_01[17]);
assign z[16] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & XNOR[18] & XNOR[17] & Min_01[16]);
assign z[15] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & XNOR[18] & XNOR[17] & XNOR[16] & Min_01[15]);
assign z[14] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & XNOR[18] & XNOR[17] & XNOR[16] & XNOR[15] & Min_01[14]);
assign z[13] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & XNOR[18] & XNOR[17] & XNOR[16] & XNOR[15] & XNOR[14] & Min_01[13]);
assign z[12] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & XNOR[18] & XNOR[17] & XNOR[16] & XNOR[15] & XNOR[14] & XNOR[13] & Min_01[12]);
assign z[11] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & XNOR[18] & XNOR[17] & XNOR[16] & XNOR[15] & XNOR[14] & XNOR[13] & XNOR[12] & Min_01[11]);
assign z[10] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & XNOR[18] & XNOR[17] & XNOR[16] & XNOR[15] & XNOR[14] & XNOR[13] & XNOR[12] & XNOR[11] & Min_01[10]);
assign z[ 9] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & XNOR[18] & XNOR[17] & XNOR[16] & XNOR[15] & XNOR[14] & XNOR[13] & XNOR[12] & XNOR[11] & XNOR[10] & Min_01[ 9]);
assign z[ 8] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & XNOR[18] & XNOR[17] & XNOR[16] & XNOR[15] & XNOR[14] & XNOR[13] & XNOR[12] & XNOR[11] & XNOR[10] & XNOR[ 9] & Min_01[ 8]);
assign z[ 7] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & XNOR[18] & XNOR[17] & XNOR[16] & XNOR[15] & XNOR[14] & XNOR[13] & XNOR[12] & XNOR[11] & XNOR[10] & XNOR[ 9] & XNOR[ 8] & Min_01[ 7]);
assign z[ 6] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & XNOR[18] & XNOR[17] & XNOR[16] & XNOR[15] & XNOR[14] & XNOR[13] & XNOR[12] & XNOR[11] & XNOR[10] & XNOR[ 9] & XNOR[ 8] & XNOR[ 7] & Min_01[ 6]);
assign z[ 5] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & XNOR[18] & XNOR[17] & XNOR[16] & XNOR[15] & XNOR[14] & XNOR[13] & XNOR[12] & XNOR[11] & XNOR[10] & XNOR[ 9] & XNOR[ 8] & XNOR[ 7] & XNOR[ 6] & Min_01[ 5]);
assign z[ 4] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & XNOR[18] & XNOR[17] & XNOR[16] & XNOR[15] & XNOR[14] & XNOR[13] & XNOR[12] & XNOR[11] & XNOR[10] & XNOR[ 9] & XNOR[ 8] & XNOR[ 7] & XNOR[ 6] & XNOR[ 5] & Min_01[ 4]);
assign z[ 3] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & XNOR[18] & XNOR[17] & XNOR[16] & XNOR[15] & XNOR[14] & XNOR[13] & XNOR[12] & XNOR[11] & XNOR[10] & XNOR[ 9] & XNOR[ 8] & XNOR[ 7] & XNOR[ 6] & XNOR[ 5] & XNOR[ 4] & Min_01[ 3]);
assign z[ 2] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & XNOR[18] & XNOR[17] & XNOR[16] & XNOR[15] & XNOR[14] & XNOR[13] & XNOR[12] & XNOR[11] & XNOR[10] & XNOR[ 9] & XNOR[ 8] & XNOR[ 7] & XNOR[ 6] & XNOR[ 5] & XNOR[ 4] & XNOR[ 3] & Min_01[ 2]);
assign z[ 1] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & XNOR[18] & XNOR[17] & XNOR[16] & XNOR[15] & XNOR[14] & XNOR[13] & XNOR[12] & XNOR[11] & XNOR[10] & XNOR[ 9] & XNOR[ 8] & XNOR[ 7] & XNOR[ 6] & XNOR[ 5] & XNOR[ 4] & XNOR[ 3] & XNOR[ 2] & Min_01[ 1]);
assign z[ 0] = (XNOR[31] & XNOR[30] & XNOR[29] & XNOR[28] & XNOR[27] & XNOR[26] & XNOR[25] & XNOR[24] & XNOR[23] & XNOR[22] &XNOR[21] & XNOR[20] & XNOR[19] & XNOR[18] & XNOR[17] & XNOR[16] & XNOR[15] & XNOR[14] & XNOR[13] & XNOR[12] & XNOR[11] & XNOR[10] & XNOR[ 9] & XNOR[ 8] & XNOR[ 7] & XNOR[ 6] & XNOR[ 5] & XNOR[ 4] & XNOR[ 3] & XNOR[ 2] & XNOR[ 1] & Min_01[ 0]);

assign result[0] = z[31] | z[30] | z[29] | z[28] | z[27] | z[26] | z[25] | z[24] | z[23] | z[22] | z[21] | z[20] | z[19] | z[18] | z[17] | z[16] | z[15] | z[14] | z[13] | z[12] | z[11] | z[10] | z[ 9] | z[ 8] | z[ 7] | z[ 6] | z[ 5] | z[ 4] | z[ 3] | z[ 2] | z[ 1] | z[ 0];
assign result[31:1] = 31'b0;
endmodule
