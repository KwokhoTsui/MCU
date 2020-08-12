`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
本文件为ALU补0左移模块设计文件
子模块：
MUX_32: 左移使用到的选择器
*/
//////////////////////////////////////////////////////////////////////////////////


module left_shift(
A,B,result
    );
input [31:0]A;//A是被移位的信号，B的后五位是移位数
input [31:0]B;
output [31:0]result;
wire [4:0]ctrl=B[4:0];
wire src0,src1,src2,src3,src4,src5,src6,src7,src8,src9,src10,src11,src12,src13,src14,src15,src16,src17,src18,src19,src20,src21,src22,src23,src24,src25,src26,src27,src28,src29,src30,src31;//32位选择器的输出端


MUX_32 MUX_31(.s({A[31:0]}),.ctrl(ctrl),.result(src31));
MUX_32 MUX_30(.s({A[30:0],1'b0}),.ctrl(ctrl),.result(src30));
MUX_32 MUX_29(.s({A[29:0],2'b0}),.ctrl(ctrl),.result(src29));
MUX_32 MUX_28(.s({A[28:0],3'b0}),.ctrl(ctrl),.result(src28));
MUX_32 MUX_27(.s({A[27:0],4'b0}),.ctrl(ctrl),.result(src27));
MUX_32 MUX_26(.s({A[26:0],5'b0}),.ctrl(ctrl),.result(src26));
MUX_32 MUX_25(.s({A[25:0],6'b0}),.ctrl(ctrl),.result(src25));
MUX_32 MUX_24(.s({A[24:0],7'b0}),.ctrl(ctrl),.result(src24));
MUX_32 MUX_23(.s({A[23:0],8'b0}),.ctrl(ctrl),.result(src23));
MUX_32 MUX_22(.s({A[22:0],9'b0}),.ctrl(ctrl),.result(src22));
MUX_32 MUX_21(.s({A[21:0],10'b0}),.ctrl(ctrl),.result(src21));
MUX_32 MUX_20(.s({A[20:0],11'b0}),.ctrl(ctrl),.result(src20));
MUX_32 MUX_19(.s({A[19:0],12'b0}),.ctrl(ctrl),.result(src19));
MUX_32 MUX_18(.s({A[18:0],13'b0}),.ctrl(ctrl),.result(src18));
MUX_32 MUX_17(.s({A[17:0],14'b0}),.ctrl(ctrl),.result(src17));
MUX_32 MUX_16(.s({A[16:0],15'b0}),.ctrl(ctrl),.result(src16));
MUX_32 MUX_15(.s({A[15:0],16'b0}),.ctrl(ctrl),.result(src15));
MUX_32 MUX_14(.s({A[14:0],17'b0}),.ctrl(ctrl),.result(src14));
MUX_32 MUX_13(.s({A[13:0],18'b0}),.ctrl(ctrl),.result(src13));
MUX_32 MUX_12(.s({A[12:0],19'b0}),.ctrl(ctrl),.result(src12));
MUX_32 MUX_11(.s({A[11:0],20'b0}),.ctrl(ctrl),.result(src11));
MUX_32 MUX_10(.s({A[10:0],21'b0}),.ctrl(ctrl),.result(src10));
MUX_32 MUX_9(.s({A[9:0],22'b0}),.ctrl(ctrl),.result(src9));
MUX_32 MUX_8(.s({A[8:0],23'b0}),.ctrl(ctrl),.result(src8));
MUX_32 MUX_7(.s({A[7:0],24'b0}),.ctrl(ctrl),.result(src7));
MUX_32 MUX_6(.s({A[6:0],25'b0}),.ctrl(ctrl),.result(src6));
MUX_32 MUX_5(.s({A[5:0],26'b0}),.ctrl(ctrl),.result(src5));
MUX_32 MUX_4(.s({A[4:0],27'b0}),.ctrl(ctrl),.result(src4));
MUX_32 MUX_3(.s({A[3:0],28'b0}),.ctrl(ctrl),.result(src3));
MUX_32 MUX_2(.s({A[2:0],29'b0}),.ctrl(ctrl),.result(src2));
MUX_32 MUX_1(.s({A[1:0],30'b0}),.ctrl(ctrl),.result(src1));
MUX_32 MUX_0(.s({A[0],31'b0}),.ctrl(ctrl),.result(src0));

assign result[31]=src31;
assign result[30]=src30;
assign result[29]=src29;
assign result[28]=src28;
assign result[27]=src27;
assign result[26]=src26;
assign result[25]=src25;
assign result[24]=src24;
assign result[23]=src23;
assign result[22]=src22;
assign result[21]=src21;
assign result[20]=src20;
assign result[19]=src19;
assign result[18]=src18;
assign result[17]=src17;
assign result[16]=src16;
assign result[15]=src15;
assign result[14]=src14;
assign result[13]=src13;
assign result[12]=src12;
assign result[11]=src11;
assign result[10]=src10;
assign result[9]=src9;
assign result[8]=src8;
assign result[7]=src7;
assign result[6]=src6;
assign result[5]=src5;
assign result[4]=src4;
assign result[3]=src3;
assign result[2]=src2;
assign result[1]=src1;
assign result[0]=src0;

endmodule

