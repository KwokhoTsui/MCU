`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*本文件为MCU的data memory模块设计文件
输入：
A（图中的A）：读数据对应的address（32 bit）， 是 MIPS 以4为倍数的 address
WD（图中的WD）：要写入的data（32 bit）
CLK（图中的CLK）：时钟信号
WE（图中的WE）：写使能
输出：
RD（图中的RD)：根据address输出的对应数据（32 bit）

additional comments:
此模块已经将 MIPS 的 address 除以4转为IP core的address
*/
//////////////////////////////////////////////////////////////////////////////////


module data_mem(
    input [31:0] A,
    input [31:0] WD,
    input CLK,
    input WE,
    
    output [31:0] RD
    );
    data_mem_d_IP your_instance_name (
  .a(A[6:0]),      // input wire [6 : 0] a
  .d(WD),      // input wire [31 : 0] d
  .clk(CLK),  // input wire clk
  .we(WE),    // input wire we
  .spo(RD)  // output wire [31 : 0] spo
);

endmodule
