`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 描述: 本文件补码模块的实现
// 子模块:
// complement_16:输入16位的x的补码，输出-x的补码
//////////////////////////////////////////////////////////////////////////////////
module complement_16(x, y);
input [15:0] x;
output [15:0] y;
wire [15:0] inverse_x;

parameter zero = 16'b0000_0000_0000_0000;
parameter one = 16'b0000_0000_0000_0001;

assign inverse_x = ~x;
carry_select_adder_16 adder(.x(inverse_x), .y(one), .cin(zero), .s(y), .cout(), .OF());
endmodule
