`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 描述：本文件为hazard unit的forward模块
// 子模块：
// Forward_Unit: Data Forwarding的顶层模块
// DataForwardA, DataForwardB: Data Forward for ALUSrc
// BranchForwardA, BranchForwardB: Data Forward for Branch
//////////////////////////////////////////////////////////////////////////////////

module Forward_Unit(RsE, RtE, RsD, RtD, WriteRegM, RegWriteM, WriteRegW, RegWriteW, ForwardAE, ForwardBE, ForwardAD, ForwardBD);
input [4:0] RsE, RtE, RsD, RtD, WriteRegM, WriteRegW;
input RegWriteM, RegWriteW;
output [1:0] ForwardAD, ForwardAE, ForwardBD, ForwardBE;
DataForwardA DataForward1(.RsE(RsE), .WriteRegM(WriteRegM), .RegWriteM(RegWriteM), .WriteRegW(WriteRegW), .RegWriteW(RegWriteW), .ForwardAE(ForwardAE));
DataForwardB DataForward2(.RtE(RtE), .WriteRegM(WriteRegM), .RegWriteM(RegWriteM), .WriteRegW(WriteRegW), .RegWriteW(RegWriteW), .ForwardBE(ForwardBE));
BranchForwardA BranchForward1(.RsD(RsD), .WriteRegM(WriteRegM), .RegWriteM(RegWriteM), .ForwardAD(ForwardAD));
BranchForwardB BranchForward2(.RtD(RtD), .WriteRegM(WriteRegM), .RegWriteM(RegWriteM), .ForwardBD(ForwardBD));
endmodule


//Data Forward for ALUSrcA
module DataForwardA(RsE, WriteRegM, RegWriteM, WriteRegW, RegWriteW, ForwardAE);
input [4:0] RsE, WriteRegM, WriteRegW;
input RegWriteW, RegWriteM;
output reg [1:0] ForwardAE;
always@(*)
begin
    if((RsE != 0) && (WriteRegM == RsE) && RegWriteM)
        ForwardAE = 2'b10;
    else if((RsE != 0) && (WriteRegW == RsE) && RegWriteW)
        ForwardAE = 2'b01;
    else
        ForwardAE = 2'b00;
end
endmodule


//Data Forward for ALUSrcB
module DataForwardB(RtE, WriteRegM, RegWriteM, WriteRegW, RegWriteW, ForwardBE);
input [4:0] RtE, WriteRegM, WriteRegW;
input RegWriteW, RegWriteM;
output reg [1:0] ForwardBE;
always@(*)
begin
    if((RtE != 0) && (WriteRegM == RtE) && RegWriteM)
        ForwardBE = 2'b10;
    else if((RtE != 0) && (WriteRegW == RtE) && RegWriteW)
        ForwardBE = 2'b01;
    else
        ForwardBE = 2'b00;
end
endmodule


//Decode stage ForwardA (for branch)
module BranchForwardA(RsD, WriteRegM, RegWriteM, ForwardAD);
input [4:0] RsD, WriteRegM;
input RegWriteM;
output reg [1:0] ForwardAD;
always@(*)
begin
    if((RsD != 0) && (RsD == WriteRegM) && RegWriteM) ForwardAD = 1'b1;
    else ForwardAD = 1'b0;
end
endmodule


//Decode stage ForwardA (for branch)
module BranchForwardB(RtD, WriteRegM, RegWriteM, ForwardBD);
input [4:0] RtD, WriteRegM;
input RegWriteM;
output reg [1:0] ForwardBD;
always@(*)
begin
    if((RtD != 0) && (RtD == WriteRegM) && RegWriteM) ForwardBD = 1'b1;
    else ForwardBD = 1'b0;
end
endmodule