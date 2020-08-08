`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ���������ļ�Ϊ5����ˮ�߳�ͻ��ⵥԪ����·ͼ����ԭ��ͼ��
// ��ģ�飺��
//////////////////////////////////////////////////////////////////////////////////

module Hazard_Unit(StallF, StallD, BranchD, JumpD, ForwardAD, ForwardBD, RsD, RtD, FlushE, RsE, RtE, ForwardAE, ForwardBE, WriteRegE, MemtoRegE, RegWriteE, WriteRegM, RegWriteM, WriteRegW, RegWriteW);
input BranchD, JumpD, RsD, RtD, RsE, RtE, MemtoRegE, RegWriteE, RegWriteM, RegWriteW;
input [4:0] WriteRegE, WriteRegM, WriteRegW;
output reg StallF, StallD, FlushE;
output reg [1:0] ForwardAD, ForwardBD, ForwardAE, ForwardBE;
reg lwstall, branchstall;

always@(*)
    begin
        //Data Forward
        if((RsE != 0) && (WriteRegM == RsE) && RegWriteM)
            ForwardAE = 2'b10;
        else if((RsE != 0) && (WriteRegW == RsE) && WriteRegW)
            ForwardAE = 2'b01;
        else
            ForwardAE = 2'b00;

        if((RtE != 0) && (WriteRegM == RtE) && RegWriteM)
            ForwardBE = 2'b10;
        else if((RtE != 0) && (WriteRegW == RtE) && WriteRegW)
            ForwardBE = 2'b01;
        else
            ForwardBE = 2'b00;
        //LW Stall judger
        if(((RsD == RtE) || (RtD == RtE)) && MemtoRegE) lwstall = 1'b1;
        //Decode stage Forward (for branch)
        if((RsD != 0) && (RsD == WriteRegM) && RegWriteM) ForwardAD = 1'b1;
        if((RtD != 0) && (RtD == WriteRegM) && RegWriteM) ForwardBD = 1'b1;
        //Branch Stall judger
        if((BranchD && RegWriteE && (WriteRegE == RsD || WriteRegE == RtD)) || (BranchD && RegWriteM && (WriteRegM == RsD || WriteRegM == RtD))) branchstall = 1'b1;
        //Make the processor stall (due to either a load or a branch hazard)
        StallF = branchstall | lwstall;
        StallD = branchstall | lwstall;
        FlushE = branchstall | lwstall | JumpD;
    end
endmodule