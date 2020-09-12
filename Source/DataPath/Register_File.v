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

对于流水线处理器，RF在CLK的下降沿进行写入操作！
*/

//////////////////////////////////////////////////////////////////////////////////


module Register_File(A1, A2, A3, WD3, WE3, RD1, RD2, CLK, RESET);

input [4:0]A1, A2, A3;
input CLK, RESET;
input WE3;
input [31:0]WD3;

output [31:0]RD1,RD2;

(* max_fanout = "20" *)reg [31:0] register [31:0];
integer i;

always@(negedge CLK or negedge RESET)
    begin
        if(!RESET)
            begin
                register[0] <= 0;
                register[1] <= 0;
                register[2] <= 0;
                register[3] <= 0;
                register[4] <= 0;
                register[5] <= 0;
                register[6] <= 0;
                register[7] <= 0;
                register[8] <= 0;
                register[9] <= 0;
                register[10] <= 0;
                register[11] <= 0;
                register[12] <= 0;
                register[13] <= 0;
                register[14] <= 0;
                register[15] <= 0;
                register[16] <= 0;
                register[17] <= 0;
                register[18] <= 0;
                register[19] <= 0;
                register[20] <= 0;
                register[21] <= 0;
                register[22] <= 0;
                register[23] <= 0;
                register[24] <= 0;
                register[25] <= 0;
                register[26] <= 0;
                register[27] <= 0;
                register[28] <= 0;
                register[29] <= 0;
                register[30] <= 0;
                register[31] <= 0;
            end
        else
            begin
                if ((A3!=0)&&WE3) register[A3] <= WD3;
            end
    end 
assign RD1=(A1==0)?0:register[A1];
assign RD2=(A2==0)?0:register[A2];

ila_0 ILA0 (
	.clk(CLK), // input wire clk


    /*.probe0(register[0]),
    .probe1(register[1]),
    .probe2(register[2]),
    .probe3(register[3]),
    .probe4(register[4]),
    .probe5(register[5]),
    .probe6(register[6]),
    .probe7(register[7]),
    .probe8(register[8]),
    .probe9(register[9]),
    .probe10(register[10]),
    .probe11(register[11]),
    .probe12(register[12]),
    .probe13(register[13]),
    .probe14(register[14]),
    .probe15(register[15]),*/
    .probe0(register[16]),
    .probe1(register[17]),
    .probe2(register[18]),
    .probe3(register[19])
    /*.probe20(register[20]),
    .probe21(register[21]),
    .probe22(register[22]),
    .probe23(register[23]),
    .probe24(register[24]),
    .probe25(register[25]),
    .probe26(register[26]),
    .probe27(register[27]),
    .probe28(register[28]),
    .probe29(register[29]),
    .probe30(register[30]),
    .probe31(register[31])*/
);
endmodule
