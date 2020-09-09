`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 描述: 本文件为八选一MUX的设计文件
// 子模块: 
// MUX_8_1:输入为 8 个 32 bit 的结果和 1 个 3 bit 的 sel 信号
// MUX_8_1_18bits:输入为 8 个 18 bit 的结果和 1 个 3 bit 的 sel 信号
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MUX_8_1(
input[31:0] in0, in1, in2, in3, in4, in5, in6, in7,
input[2:0] sel,
output[31:0] R
    );
    wire ctr0 = ~sel[2] & ~sel[1] & ~sel[0]; // 000
    wire ctr1 = ~sel[2] & ~sel[1] & sel[0]; // 001
    wire ctr2 = ~sel[2] & sel[1] & ~sel[0]; // 010
    wire ctr3 = ~sel[2] & sel[1] & sel[0]; // 011
    wire ctr4 = sel[2] & ~sel[1] & ~sel[0]; // 100
    wire ctr5 = sel[2] & ~sel[1] & sel[0]; // 101
    wire ctr6 = sel[2] & sel[1] & ~sel[0]; // 110
    wire ctr7 = sel[2] & sel[1] & sel[0]; // 111
    
    assign R[31] = (ctr0 & in0[31]) | (ctr1 & in1[31]) | (ctr2 & in2[31]) | (ctr3 & in3[31]) | (ctr4 & in4[31]) | (ctr5 & in5[31]) | (ctr6 & in6[31]) | (ctr7 & in7[31]);
    assign R[30] = (ctr0 & in0[30]) | (ctr1 & in1[30]) | (ctr2 & in2[30]) | (ctr3 & in3[30]) | (ctr4 & in4[30]) | (ctr5 & in5[30]) | (ctr6 & in6[30]) | (ctr7 & in7[30]);
    assign R[29] = (ctr0 & in0[29]) | (ctr1 & in1[29]) | (ctr2 & in2[29]) | (ctr3 & in3[29]) | (ctr4 & in4[29]) | (ctr5 & in5[29]) | (ctr6 & in6[29]) | (ctr7 & in7[29]);
    assign R[28] = (ctr0 & in0[28]) | (ctr1 & in1[28]) | (ctr2 & in2[28]) | (ctr3 & in3[28]) | (ctr4 & in4[28]) | (ctr5 & in5[28]) | (ctr6 & in6[28]) | (ctr7 & in7[28]);
    assign R[27] = (ctr0 & in0[27]) | (ctr1 & in1[27]) | (ctr2 & in2[27]) | (ctr3 & in3[27]) | (ctr4 & in4[27]) | (ctr5 & in5[27]) | (ctr6 & in6[27]) | (ctr7 & in7[27]);
    assign R[26] = (ctr0 & in0[26]) | (ctr1 & in1[26]) | (ctr2 & in2[26]) | (ctr3 & in3[26]) | (ctr4 & in4[26]) | (ctr5 & in5[26]) | (ctr6 & in6[26]) | (ctr7 & in7[26]);
    assign R[25] = (ctr0 & in0[25]) | (ctr1 & in1[25]) | (ctr2 & in2[25]) | (ctr3 & in3[25]) | (ctr4 & in4[25]) | (ctr5 & in5[25]) | (ctr6 & in6[25]) | (ctr7 & in7[25]);
    assign R[24] = (ctr0 & in0[24]) | (ctr1 & in1[24]) | (ctr2 & in2[24]) | (ctr3 & in3[24]) | (ctr4 & in4[24]) | (ctr5 & in5[24]) | (ctr6 & in6[24]) | (ctr7 & in7[24]);
    assign R[23] = (ctr0 & in0[23]) | (ctr1 & in1[23]) | (ctr2 & in2[23]) | (ctr3 & in3[23]) | (ctr4 & in4[23]) | (ctr5 & in5[23]) | (ctr6 & in6[23]) | (ctr7 & in7[23]);
    assign R[22] = (ctr0 & in0[22]) | (ctr1 & in1[22]) | (ctr2 & in2[22]) | (ctr3 & in3[22]) | (ctr4 & in4[22]) | (ctr5 & in5[22]) | (ctr6 & in6[22]) | (ctr7 & in7[22]);
    assign R[21] = (ctr0 & in0[21]) | (ctr1 & in1[21]) | (ctr2 & in2[21]) | (ctr3 & in3[21]) | (ctr4 & in4[21]) | (ctr5 & in5[21]) | (ctr6 & in6[21]) | (ctr7 & in7[21]);
    assign R[20] = (ctr0 & in0[20]) | (ctr1 & in1[20]) | (ctr2 & in2[20]) | (ctr3 & in3[20]) | (ctr4 & in4[20]) | (ctr5 & in5[20]) | (ctr6 & in6[20]) | (ctr7 & in7[20]);
    assign R[19] = (ctr0 & in0[19]) | (ctr1 & in1[19]) | (ctr2 & in2[19]) | (ctr3 & in3[19]) | (ctr4 & in4[19]) | (ctr5 & in5[19]) | (ctr6 & in6[19]) | (ctr7 & in7[19]);
    assign R[18] = (ctr0 & in0[18]) | (ctr1 & in1[18]) | (ctr2 & in2[18]) | (ctr3 & in3[18]) | (ctr4 & in4[18]) | (ctr5 & in5[18]) | (ctr6 & in6[18]) | (ctr7 & in7[18]);
    assign R[17] = (ctr0 & in0[17]) | (ctr1 & in1[17]) | (ctr2 & in2[17]) | (ctr3 & in3[17]) | (ctr4 & in4[17]) | (ctr5 & in5[17]) | (ctr6 & in6[17]) | (ctr7 & in7[17]);
    assign R[16] = (ctr0 & in0[16]) | (ctr1 & in1[16]) | (ctr2 & in2[16]) | (ctr3 & in3[16]) | (ctr4 & in4[16]) | (ctr5 & in5[16]) | (ctr6 & in6[16]) | (ctr7 & in7[16]);
    assign R[15] = (ctr0 & in0[15]) | (ctr1 & in1[15]) | (ctr2 & in2[15]) | (ctr3 & in3[15]) | (ctr4 & in4[15]) | (ctr5 & in5[15]) | (ctr6 & in6[15]) | (ctr7 & in7[15]);
    assign R[14] = (ctr0 & in0[14]) | (ctr1 & in1[14]) | (ctr2 & in2[14]) | (ctr3 & in3[14]) | (ctr4 & in4[14]) | (ctr5 & in5[14]) | (ctr6 & in6[14]) | (ctr7 & in7[14]);
    assign R[13] = (ctr0 & in0[13]) | (ctr1 & in1[13]) | (ctr2 & in2[13]) | (ctr3 & in3[13]) | (ctr4 & in4[13]) | (ctr5 & in5[13]) | (ctr6 & in6[13]) | (ctr7 & in7[13]);
    assign R[12] = (ctr0 & in0[12]) | (ctr1 & in1[12]) | (ctr2 & in2[12]) | (ctr3 & in3[12]) | (ctr4 & in4[12]) | (ctr5 & in5[12]) | (ctr6 & in6[12]) | (ctr7 & in7[12]);
    assign R[11] = (ctr0 & in0[11]) | (ctr1 & in1[11]) | (ctr2 & in2[11]) | (ctr3 & in3[11]) | (ctr4 & in4[11]) | (ctr5 & in5[11]) | (ctr6 & in6[11]) | (ctr7 & in7[11]);
    assign R[10] = (ctr0 & in0[10]) | (ctr1 & in1[10]) | (ctr2 & in2[10]) | (ctr3 & in3[10]) | (ctr4 & in4[10]) | (ctr5 & in5[10]) | (ctr6 & in6[10]) | (ctr7 & in7[10]);
    assign R[9] = (ctr0 & in0[9]) | (ctr1 & in1[9]) | (ctr2 & in2[9]) | (ctr3 & in3[9]) | (ctr4 & in4[9]) | (ctr5 & in5[9]) | (ctr6 & in6[9]) | (ctr7 & in7[9]);
    assign R[8] = (ctr0 & in0[8]) | (ctr1 & in1[8]) | (ctr2 & in2[8]) | (ctr3 & in3[8]) | (ctr4 & in4[8]) | (ctr5 & in5[8]) | (ctr6 & in6[8]) | (ctr7 & in7[8]);
    assign R[7] = (ctr0 & in0[7]) | (ctr1 & in1[7]) | (ctr2 & in2[7]) | (ctr3 & in3[7]) | (ctr4 & in4[7]) | (ctr5 & in5[7]) | (ctr6 & in6[7]) | (ctr7 & in7[7]);
    assign R[6] = (ctr0 & in0[6]) | (ctr1 & in1[6]) | (ctr2 & in2[6]) | (ctr3 & in3[6]) | (ctr4 & in4[6]) | (ctr5 & in5[6]) | (ctr6 & in6[6]) | (ctr7 & in7[6]);
    assign R[5] = (ctr0 & in0[5]) | (ctr1 & in1[5]) | (ctr2 & in2[5]) | (ctr3 & in3[5]) | (ctr4 & in4[5]) | (ctr5 & in5[5]) | (ctr6 & in6[5]) | (ctr7 & in7[5]);
    assign R[4] = (ctr0 & in0[4]) | (ctr1 & in1[4]) | (ctr2 & in2[4]) | (ctr3 & in3[4]) | (ctr4 & in4[4]) | (ctr5 & in5[4]) | (ctr6 & in6[4]) | (ctr7 & in7[4]);
    assign R[3] = (ctr0 & in0[3]) | (ctr1 & in1[3]) | (ctr2 & in2[3]) | (ctr3 & in3[3]) | (ctr4 & in4[3]) | (ctr5 & in5[3]) | (ctr6 & in6[3]) | (ctr7 & in7[3]);
    assign R[2] = (ctr0 & in0[2]) | (ctr1 & in1[2]) | (ctr2 & in2[2]) | (ctr3 & in3[2]) | (ctr4 & in4[2]) | (ctr5 & in5[2]) | (ctr6 & in6[2]) | (ctr7 & in7[2]);
    assign R[1] = (ctr0 & in0[1]) | (ctr1 & in1[1]) | (ctr2 & in2[1]) | (ctr3 & in3[1]) | (ctr4 & in4[1]) | (ctr5 & in5[1]) | (ctr6 & in6[1]) | (ctr7 & in7[1]);
    assign R[0] = (ctr0 & in0[0]) | (ctr1 & in1[0]) | (ctr2 & in2[0]) | (ctr3 & in3[0]) | (ctr4 & in4[0]) | (ctr5 & in5[0]) | (ctr6 & in6[0]) | (ctr7 & in7[0]);
    
endmodule

module MUX_8_1_18bits(
    input[17:0] in0, in1, in2, in3, in4, in5, in6, in7,
    input[2:0] sel,
    output[17:0] R
);
    wire ctr0 = ~sel[2] & ~sel[1] & ~sel[0]; // 000
    wire ctr1 = ~sel[2] & ~sel[1] & sel[0]; // 001
    wire ctr2 = ~sel[2] & sel[1] & ~sel[0]; // 010
    wire ctr3 = ~sel[2] & sel[1] & sel[0]; // 011
    wire ctr4 = sel[2] & ~sel[1] & ~sel[0]; // 100
    wire ctr5 = sel[2] & ~sel[1] & sel[0]; // 101
    wire ctr6 = sel[2] & sel[1] & ~sel[0]; // 110
    wire ctr7 = sel[2] & sel[1] & sel[0]; // 111
    
    assign R[17] = (ctr0 & in0[17]) | (ctr1 & in1[17]) | (ctr2 & in2[17]) | (ctr3 & in3[17]) | (ctr4 & in4[17]) | (ctr5 & in5[17]) | (ctr6 & in6[17]) | (ctr7 & in7[17]);
    assign R[16] = (ctr0 & in0[16]) | (ctr1 & in1[16]) | (ctr2 & in2[16]) | (ctr3 & in3[16]) | (ctr4 & in4[16]) | (ctr5 & in5[16]) | (ctr6 & in6[16]) | (ctr7 & in7[16]);
    assign R[15] = (ctr0 & in0[15]) | (ctr1 & in1[15]) | (ctr2 & in2[15]) | (ctr3 & in3[15]) | (ctr4 & in4[15]) | (ctr5 & in5[15]) | (ctr6 & in6[15]) | (ctr7 & in7[15]);
    assign R[14] = (ctr0 & in0[14]) | (ctr1 & in1[14]) | (ctr2 & in2[14]) | (ctr3 & in3[14]) | (ctr4 & in4[14]) | (ctr5 & in5[14]) | (ctr6 & in6[14]) | (ctr7 & in7[14]);
    assign R[13] = (ctr0 & in0[13]) | (ctr1 & in1[13]) | (ctr2 & in2[13]) | (ctr3 & in3[13]) | (ctr4 & in4[13]) | (ctr5 & in5[13]) | (ctr6 & in6[13]) | (ctr7 & in7[13]);
    assign R[12] = (ctr0 & in0[12]) | (ctr1 & in1[12]) | (ctr2 & in2[12]) | (ctr3 & in3[12]) | (ctr4 & in4[12]) | (ctr5 & in5[12]) | (ctr6 & in6[12]) | (ctr7 & in7[12]);
    assign R[11] = (ctr0 & in0[11]) | (ctr1 & in1[11]) | (ctr2 & in2[11]) | (ctr3 & in3[11]) | (ctr4 & in4[11]) | (ctr5 & in5[11]) | (ctr6 & in6[11]) | (ctr7 & in7[11]);
    assign R[10] = (ctr0 & in0[10]) | (ctr1 & in1[10]) | (ctr2 & in2[10]) | (ctr3 & in3[10]) | (ctr4 & in4[10]) | (ctr5 & in5[10]) | (ctr6 & in6[10]) | (ctr7 & in7[10]);
    assign R[9] = (ctr0 & in0[9]) | (ctr1 & in1[9]) | (ctr2 & in2[9]) | (ctr3 & in3[9]) | (ctr4 & in4[9]) | (ctr5 & in5[9]) | (ctr6 & in6[9]) | (ctr7 & in7[9]);
    assign R[8] = (ctr0 & in0[8]) | (ctr1 & in1[8]) | (ctr2 & in2[8]) | (ctr3 & in3[8]) | (ctr4 & in4[8]) | (ctr5 & in5[8]) | (ctr6 & in6[8]) | (ctr7 & in7[8]);
    assign R[7] = (ctr0 & in0[7]) | (ctr1 & in1[7]) | (ctr2 & in2[7]) | (ctr3 & in3[7]) | (ctr4 & in4[7]) | (ctr5 & in5[7]) | (ctr6 & in6[7]) | (ctr7 & in7[7]);
    assign R[6] = (ctr0 & in0[6]) | (ctr1 & in1[6]) | (ctr2 & in2[6]) | (ctr3 & in3[6]) | (ctr4 & in4[6]) | (ctr5 & in5[6]) | (ctr6 & in6[6]) | (ctr7 & in7[6]);
    assign R[5] = (ctr0 & in0[5]) | (ctr1 & in1[5]) | (ctr2 & in2[5]) | (ctr3 & in3[5]) | (ctr4 & in4[5]) | (ctr5 & in5[5]) | (ctr6 & in6[5]) | (ctr7 & in7[5]);
    assign R[4] = (ctr0 & in0[4]) | (ctr1 & in1[4]) | (ctr2 & in2[4]) | (ctr3 & in3[4]) | (ctr4 & in4[4]) | (ctr5 & in5[4]) | (ctr6 & in6[4]) | (ctr7 & in7[4]);
    assign R[3] = (ctr0 & in0[3]) | (ctr1 & in1[3]) | (ctr2 & in2[3]) | (ctr3 & in3[3]) | (ctr4 & in4[3]) | (ctr5 & in5[3]) | (ctr6 & in6[3]) | (ctr7 & in7[3]);
    assign R[2] = (ctr0 & in0[2]) | (ctr1 & in1[2]) | (ctr2 & in2[2]) | (ctr3 & in3[2]) | (ctr4 & in4[2]) | (ctr5 & in5[2]) | (ctr6 & in6[2]) | (ctr7 & in7[2]);
    assign R[1] = (ctr0 & in0[1]) | (ctr1 & in1[1]) | (ctr2 & in2[1]) | (ctr3 & in3[1]) | (ctr4 & in4[1]) | (ctr5 & in5[1]) | (ctr6 & in6[1]) | (ctr7 & in7[1]);
    assign R[0] = (ctr0 & in0[0]) | (ctr1 & in1[0]) | (ctr2 & in2[0]) | (ctr3 & in3[0]) | (ctr4 & in4[0]) | (ctr5 & in5[0]) | (ctr6 & in6[0]) | (ctr7 & in7[0]);
    
endmodule

