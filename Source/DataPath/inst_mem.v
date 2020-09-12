`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*���ļ�ΪMCU��instruction memoryģ������ļ�
���룺
A��ͼ�е�A���������ݶ�Ӧ��address��32 bit���� �� MIPS ��4Ϊ������ address

�����
RD��ͼ�е�RD)������address����Ķ�Ӧ���ݣ�32 bit��

additional comments:
��ģ���Ѿ��� MIPS �� address ����4תΪIP core��address
*/
//////////////////////////////////////////////////////////////////////////////////


module inst_mem(
    input [31:0] A,
    input reset,
    output [31:0] RD
    );

inst_mem_rom_IP your_instance_name (
  .a(A[13:2]),      // input wire [6 : 0] a
  .spo(RD)  // output wire [31 : 0] spo
);

endmodule
