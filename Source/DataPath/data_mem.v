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
    input [31:0]cnt,
    
    output [31:0] RD
    );
    wire [15:0] final_result;
    data_mem_d_IP your_instance_name (
  .a(A[9:2]),      // input wire [7 : 0] a
  .d(WD),      // input wire [31 : 0] d
  .clk(CLK),  // input wire clk
  .we(WE),    // input wire we
  .spo(RD)  // output wire [31 : 0] spo
);
assign final_result = {RD[31], RD[26:24], RD[23:12]};
ila_1 data_RD (
	.clk(CLK), // input wire clk


	.probe0(cnt), // input wire [31:0]  probe0  
	.probe1(RD), // input wire [31:0]  probe1 
	.probe2(WD), // input wire [31:0]  probe2
	.probe3(final_result),
	.probe4(WE)
);

endmodule
