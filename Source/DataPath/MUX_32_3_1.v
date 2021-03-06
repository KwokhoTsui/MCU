`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*本文件为 32 位 3 选 1 MUX设计文件
输入：
in_00：32 位 00 口的输入
in_01：32 位 01 口的输入
in_10：32 位 10 口的输入
sel：选择信号
输出：
out ：MUX的输出
*/
//////////////////////////////////////////////////////////////////////////////////


module MUX_32_3_1( 
in_00, in_01, in_10, sel, out
    );
    input[31:0] in_00, in_01, in_10;
    input[1:0] sel;
    output reg [31:0] out;
    
    always @ (*)
		begin
			case(sel)
				2'b00: out = in_00;
				2'b01: out = in_01;
				2'b10: out = in_10;
			endcase
		end
endmodule
