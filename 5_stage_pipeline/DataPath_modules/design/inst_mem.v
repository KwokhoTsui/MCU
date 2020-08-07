`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*本文件为MCU的instruction memory模块设计文件
输入：
A（图中的A）：读数据对应的address（32 bit）， 是 MIPS 以4为倍数的 address

输出：
RD（图中的RD)：根据address输出的对应数据（32 bit）

additional comments:
此模块已经将 MIPS 的 address 除以4转为IP core的address
*/
//////////////////////////////////////////////////////////////////////////////////


module inst_mem(
    input [31:0] A,
    input reset,
    output [31:0] RD
    );

inst_mem_rom_IP your_instance_name (
  .a(A[8:2]),      // input wire [6 : 0] a
  .spo(RD)  // output wire [31 : 0] spo
);

endmodule
