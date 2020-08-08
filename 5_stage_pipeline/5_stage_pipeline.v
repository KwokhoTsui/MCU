`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ���������ļ�Ϊ5����ˮ�ߴ���������·ͼ����ԭ��ͼ��
//////////////////////////////////////////////////////////////////////////////////
module five_stage_pipeline(clk ,reset);
input clk, reset;

wire clk, reset, RegWriteD, MemtoRegD, MemWriteD, ALUSrcD, RegDstD, JumpD, BranchD, StallF, StallD, ForwardAD, ForwardBD, FlushE, ForwardAE, ForwardBE;
wire [2:0] ALUControlD;
wire [5:0] Op, Funct;
wire [4:0] RsD_HU, RtD_HU, RsE_HU, RtE_HU, WriteRegE_HU, WriteRegM_HU, WriteRegW_HU;
wire BranchD_HU, JumpD_HU, MemtoRegE_HU, RegWriteE_HU, RegWriteM_HU, RegWriteW_HU;

five_pipeline_data_path data_path(.Op(Op), .Funct(Funct), .RsD_HU(RsD_HU), .RtD_HU(RtD_HU), .RsE_HU(RsE_HU), .RtE_HU(RtE_HU), .WriteRegE_HU(WriteRegE_HU), .WriteRegM_HU(WriteRegM_HU), .WriteRegW_HU(WriteRegW_HU), .clk(clk), .reset(reset), .RegWriteD(RegWriteD), .MemtoRegD(MemtoRegD), .MemWriteD(MemWriteD), .ALUSrcD(ALUSrcD), .RegDstD(RegDstD), .JumpD(JumpD), .BranchD(BranchD), .ALUControlD(ALUControlD), .StallF(StallF), .StallD(StallD), .ForwardAD(ForwardAD), .ForwardBD(ForwardBD), .FlushE(FlushE), .ForwardAE(ForwardAE), .ForwardBE(ForwardBE), .BranchD_HU(BranchD_HU), .JumpD_HU(JumpD_HU), .MemtoRegE_HU(MemtoRegE_HU), .RegWriteE_HU(RegWriteE_HU), .RegWriteM_HU(RegWriteM_HU), .RegWriteW_HU(RegWriteW_HU));
Hazard_Unit hazard_unit(.StallF(StallF), .StallD(StallD), .BranchD(BranchD), .JumpD(JumpD), .ForwardAD(ForwardAD), .ForwardBD(ForwardBD), .RsD(RsD), .RtD(RtD), .FlushE(FlushE), .RsE(RsE), .RtE(RtE), .ForwardAE(ForwardAE), .ForwardBE(ForwardBE), .WriteRegE(WriteRegE), .MemtoRegE(MemtoRegE), .RegWriteE(RegWriteE), .WriteRegM(WriteRegM), .RegWriteM(RegWriteM), .WriteRegW(WriteRegW), .RegWriteW(RegWriteW));
Control_Unit control_unit(.op(Op),.funct(Funct),.reset(reset),.MemtoReg(MemtoRegD),.RegDst(RegDstD),.MemWrite(MemWriteD),.AluControl(AluControlD),.AluSrc(AluSrcD),.Branch(BranchD),.RegWrite(RegWriteD),.Jump(JumpD));
endmodule