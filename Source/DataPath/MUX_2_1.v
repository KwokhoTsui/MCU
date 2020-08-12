`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*本文件为 32 位 2 选 1 MUX设计文件
输入：
in_0：32 位 0 口的输入
in_1：32 位 1 口的输入
sel：选择信号
输出：
out ：MUX的输出
*/
//////////////////////////////////////////////////////////////////////////////////


module MUX_2_1(
in_0, in_1, sel, out
    );
    input[31:0] in_0, in_1;
    input sel;
    output reg [31:0] out;
    
    always @ (*)
		begin
			case(sel)
				1'b0: out = in_0;
				1'b1: out = in_1;
			endcase
		end
    
endmodule
