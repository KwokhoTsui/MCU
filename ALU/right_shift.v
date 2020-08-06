`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
本文件为ALU补0右移模块设计文件
子模块：
MUX_32_R: 右移使用到的选择器
*/
//////////////////////////////////////////////////////////////////////////////////


module right_shift(A,shamt,result);

input [31:0]A;//A是被移位的信号，B的后五位是移位数
input [4:0]shamt;
output [31:0]result;
wire [4:0]ctrl=shamt[4:0];
wire src0,src1,src2,src3,src4,src5,src6,src7,src8,src9,src10,src11,src12,src13,src14,src15,src16,src17,src18,src19,src20,src21,src22,src23,src24,src25,src26,src27,src28,src29,src30,src31;//32位选择器的输出端


MUX_32_R MUX_31(.s({A[31:0]}),.ctrl(ctrl),.result(src31));
MUX_32_R MUX_30(.s({1'b0,A[31:1]}),.ctrl(ctrl),.result(src30));
MUX_32_R MUX_29(.s({2'b0,A[31:2]}),.ctrl(ctrl),.result(src29));
MUX_32_R MUX_28(.s({3'b0,A[31:3]}),.ctrl(ctrl),.result(src28));
MUX_32_R MUX_27(.s({4'b0,A[31:4]}),.ctrl(ctrl),.result(src27));
MUX_32_R MUX_26(.s({5'b0,A[31:5]}),.ctrl(ctrl),.result(src26));
MUX_32_R MUX_25(.s({6'b0,A[31:6]}),.ctrl(ctrl),.result(src25));
MUX_32_R MUX_24(.s({7'b0,A[31:7]}),.ctrl(ctrl),.result(src24));
MUX_32_R MUX_23(.s({8'b0,A[31:8]}),.ctrl(ctrl),.result(src23));
MUX_32_R MUX_22(.s({9'b0,A[31:9]}),.ctrl(ctrl),.result(src22));
MUX_32_R MUX_21(.s({10'b0,A[31:10]}),.ctrl(ctrl),.result(src21));
MUX_32_R MUX_20(.s({11'b0,A[31:11]}),.ctrl(ctrl),.result(src20));
MUX_32_R MUX_19(.s({12'b0,A[31:12]}),.ctrl(ctrl),.result(src19));
MUX_32_R MUX_18(.s({13'b0,A[31:13]}),.ctrl(ctrl),.result(src18));
MUX_32_R MUX_17(.s({14'b0,A[31:14]}),.ctrl(ctrl),.result(src17));
MUX_32_R MUX_16(.s({15'b0,A[31:15]}),.ctrl(ctrl),.result(src16));
MUX_32_R MUX_15(.s({16'b0,A[31:16]}),.ctrl(ctrl),.result(src15));
MUX_32_R MUX_14(.s({17'b0,A[31:17]}),.ctrl(ctrl),.result(src14));
MUX_32_R MUX_13(.s({18'b0,A[31:18]}),.ctrl(ctrl),.result(src13));
MUX_32_R MUX_12(.s({19'b0,A[31:19]}),.ctrl(ctrl),.result(src12));
MUX_32_R MUX_11(.s({20'b0,A[31:20]}),.ctrl(ctrl),.result(src11));
MUX_32_R MUX_10(.s({21'b0,A[31:21]}),.ctrl(ctrl),.result(src10));
MUX_32_R MUX_9(.s({22'b0,A[31:22]}),.ctrl(ctrl),.result(src9));
MUX_32_R MUX_8(.s({23'b0,A[31:23]}),.ctrl(ctrl),.result(src8));
MUX_32_R MUX_7(.s({24'b0,A[31:24]}),.ctrl(ctrl),.result(src7));
MUX_32_R MUX_6(.s({25'b0,A[31:25]}),.ctrl(ctrl),.result(src6));
MUX_32_R MUX_5(.s({26'b0,A[31:26]}),.ctrl(ctrl),.result(src5));
MUX_32_R MUX_4(.s({27'b0,A[31:27]}),.ctrl(ctrl),.result(src4));
MUX_32_R MUX_3(.s({28'b0,A[31:28]}),.ctrl(ctrl),.result(src3));
MUX_32_R MUX_2(.s({29'b0,A[31:29]}),.ctrl(ctrl),.result(src2));
MUX_32_R MUX_1(.s({30'b0,A[31:30]}),.ctrl(ctrl),.result(src1));
MUX_32_R MUX_0(.s({31'b0,A[31]}),.ctrl(ctrl),.result(src0));

assign result[31]=src0;
assign result[30]=src1;
assign result[29]=src2;
assign result[28]=src3;
assign result[27]=src4;
assign result[26]=src5;
assign result[25]=src6;
assign result[24]=src7;
assign result[23]=src8;
assign result[22]=src9;
assign result[21]=src10;
assign result[20]=src11;
assign result[19]=src12;
assign result[18]=src13;
assign result[17]=src14;
assign result[16]=src15;
assign result[15]=src16;
assign result[14]=src17;
assign result[13]=src18;
assign result[12]=src19;
assign result[11]=src20;
assign result[10]=src21;
assign result[9]=src22;
assign result[8]=src23;
assign result[7]=src24;
assign result[6]=src25;
assign result[5]=src26;
assign result[4]=src27;
assign result[3]=src28;
assign result[2]=src29;
assign result[1]=src30;
assign result[0]=src31;

endmodule
