`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*���ļ�Ϊ 32 λ 2 ѡ 1 MUX����ļ�
���룺
in_0��32 λ 0 �ڵ�����
in_1��32 λ 1 �ڵ�����
sel��ѡ���ź�
�����
out ��MUX�����
*/
//////////////////////////////////////////////////////////////////////////////////


module MUX_2_1(in_0, in_1, sel, out);
    input[31:0] in_0, in_1;
    input sel;
    output [31:0] out;
	assign out = (sel == 1'b0 ? in_0:in_1);
endmodule