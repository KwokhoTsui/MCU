`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 描述：本文件为5级流水线处理器（电路图参照原理图）
//////////////////////////////////////////////////////////////////////////////////
module five_stage_pipeline(clk ,reset);
input clk, reset;

wire clk, reset, RegWriteD, MemtoRegD, MemWriteD, AluSrcD, RegDstD, BranchD, JumpD, StallF, StallD, ForwardAD, ForwardBD, FlushE;
wire [1:0] ForwardAE, ForwardBE;
wire [2:0] AluControlD;
wire [4:0] RsD_HU, RtD_HU, RsE_HU, RtE_HU, WriteRegE_HU, WriteRegM_HU, WriteRegW_HU;
wire [5:0] Op, Funct;
wire BranchD_HU, JumpD_HU, MemtoRegE_HU, RegWriteE_HU, RegWriteM_HU, RegWriteW_HU;

five_pipeline_data_path data_path(.Op(Op), .Funct(Funct), .RsD_HU(RsD_HU), .RtD_HU(RtD_HU), .RsE_HU(RsE_HU), .RtE_HU(RtE_HU), .WriteRegE_HU(WriteRegE_HU), .WriteRegM_HU(WriteRegM_HU), .WriteRegW_HU(WriteRegW_HU), .clk(clk), .reset(reset), .RegWriteD(RegWriteD), .MemtoRegD(MemtoRegD), .MemWriteD(MemWriteD), .ALUSrcD(AluSrcD), .RegDstD(RegDstD), .JumpD(JumpD), .BranchD(BranchD), .ALUControlD(AluControlD), .StallF(StallF), .StallD(StallD), .ForwardAD(ForwardAD), .ForwardBD(ForwardBD), .FlushE(FlushE), .ForwardAE(ForwardAE), .ForwardBE(ForwardBE), .BranchD_HU(BranchD_HU), .JumpD_HU(JumpD_HU), .MemtoRegE_HU(MemtoRegE_HU), .RegWriteE_HU(RegWriteE_HU), .RegWriteM_HU(RegWriteM_HU), .RegWriteW_HU(RegWriteW_HU));
Hazard_Unit hazard_unit(.clk(clk),.StallF(StallF), .StallD(StallD), .BranchD(BranchD_HU), .JumpD(JumpD_HU), .ForwardAD(ForwardAD), .ForwardBD(ForwardBD), .RsD(RsD_HU), .RtD(RtD_HU), .FlushE(FlushE), .RsE(RsE_HU), .RtE(RtE_HU), .ForwardAE(ForwardAE), .ForwardBE(ForwardBE), .WriteRegE(WriteRegE_HU), .MemtoRegE(MemtoRegE_HU), .RegWriteE(RegWriteE_HU), .WriteRegM(WriteRegM_HU), .RegWriteM(RegWriteM_HU), .WriteRegW(WriteRegW_HU), .RegWriteW(RegWriteW_HU));
Control_Unit control_unit(.op(Op),.funct(Funct),.reset(reset),.MemtoReg(MemtoRegD),.RegDst(RegDstD),.MemWrite(MemWriteD),.AluControl(AluControlD),.AluSrc(AluSrcD),.Branch(BranchD),.RegWrite(RegWriteD),.Jump(JumpD));
endmodule