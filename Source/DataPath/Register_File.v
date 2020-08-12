`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*���ļ�ΪMCU��Registerģ������ļ�
���룺
A1��ͼ�е�A1���������ݶ�Ӧ��address��5 bit��A1=instr[25:21]
A2��ͼ�е�A2���������ݶ�Ӧ��address��5 bit��A2=instr[20:16]
A3��ͼ�е�A3����д���ݶ�Ӧ��address��5 bit��A3=instr[20:16](I type)�� instr[15:11](R type)
WD3��ͼ�е�WD3����Ҫд��register��data
WE3��ͼ�е�WE3)��дʹ�ܣ�write_enable=1��������д�����ݴ洢����write_enable=0���������ݴ洢������
CLK��ʱ���źţ�ÿ��ʱ�������ص���ʱ������mem_RW���ж�

�����
RD1��ͼ�е�RD1)������address����Ķ�Ӧ����
RD2��ͼ�е�RD2��������address����Ķ�Ӧ����

additional comments:
ÿ��register�ı�ſ��Բ鿴�̲�184ҳ���, e.g. 0:$0, 1:$at, 2:$v0 ......
*/

//////////////////////////////////////////////////////////////////////////////////


module Register_File(A1, A2, A3, WD3, WE3, RD1, RD2, CLK, RESET);

input [4:0]A1, A2, A3;
input CLK, RESET;
input WE3;
input [31:0]WD3;

output [31:0]RD1,RD2;

reg [31:0] register [31:0];
integer i;

always@(*)
    begin
        if(!RESET)
            begin
                for (i=0;i<32;i=i+1) register[i] <= 0;
            end
        else
            begin
                if ((A3!=0)&&WE3) register[A3] <= WD3;
            end
    end 

assign RD1=(A1==0)?0:register[A1];
assign RD2=(A2==0)?0:register[A2];

endmodule
