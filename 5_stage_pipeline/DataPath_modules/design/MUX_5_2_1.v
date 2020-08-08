`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*本文件为 5 位 2 选 1 MUX设计文件
输入：
in_0：5 位 0 口的输入
in_1：5 位 1 口的输入
sel：选择信号
输出：
out ：MUX的输出
*/
//////////////////////////////////////////////////////////////////////////////////


module MUX_5_2_1(in_0, in_1, sel, out);
    input[4:0] in_0, in_1;
    input sel;
    output [4:0] out;
	assign out = (sel == in_0 ? in_0:in_1);
endmodule