`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*本文件为MCU的Register模块设计文件
输入：
A1（图中的A1）：读数据对应的address（5 bit）A1=instr[25:21]
A2（图中的A2）：读数据对应的address（5 bit）A2=instr[20:16]
A3（图中的A3）：写数据对应的address（5 bit）A3=instr[20:16](I type)， instr[15:11](R type)
WD3（图中的WD3）：要写入register的data
WE3（图中的WE3)：写使能，write_enable=1，将数据写入数据存储器，write_enable=0，读出数据存储器数据
CLK：时钟信号，每当时钟上升沿到来时，进行mem_RW的判断

输出：
RD1（图中的RD1)：根据address输出的对应数据
RD2（图中的RD2）：根据address输出的对应数据

additional comments:
每个register的编号可以查看教材184页表格, e.g. 0:$0, 1:$at, 2:$v0 ......
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

always@(posedge CLK or negedge RESET)
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
