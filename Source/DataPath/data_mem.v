`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*���ļ�ΪMCU��data memoryģ������ļ�
���룺
A��ͼ�е�A���������ݶ�Ӧ��address��32 bit���� �� MIPS ��4Ϊ������ address
WD��ͼ�е�WD����Ҫд���data��32 bit��
CLK��ͼ�е�CLK����ʱ���ź�
WE��ͼ�е�WE����дʹ��
�����
RD��ͼ�е�RD)������address����Ķ�Ӧ���ݣ�32 bit��

additional comments:
��ģ���Ѿ��� MIPS �� address ����4תΪIP core��address
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
