`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////////
/*本文件为MCU的data path模块设计文件（5级流水）
变量名解释：部分变量名末尾都有一个大写字母：F、D、E、M、W分别对应五级流水的变量名。
            除了input/output的声明之外，其他变量的声明都可以在Variable Declaration
            部分找到，该部分被空行分为5个部分，对应5级流水，各级流水对应的变量就在对应
            部分。
            输出变量除了Op、Funct之外，其他都带有_HU后缀，表示它是输出到Hazard_Unit的变量
各级流水代码：各级流水的代码都写在对应标题下方。每一块代码的排列方式如下：
            所有assign语句、所有模块调用语句、所有always@语句
*/
////////////////////////////////////////////////////////////////////////////////////////
module SignExtend(x, y);
input[15:0] x;
output [31:0] y;
assign y = {{16{x[15]}}, x};
endmodule


module five_pipeline_data_path(Op, Funct, RsD_HU, RtD_HU, RsE_HU, RtE_HU, WriteRegE_HU, WriteRegM_HU, WriteRegW_HU, clk, reset, RegWriteD, MemtoRegD, MemWriteD, ALUSrcD, RegDstD, JumpD, BranchD, ALUControlD, StallF, StallD, ForwardAD, ForwardBD, FlushE, ForwardAE, ForwardBE, BranchD_HU, JumpD_HU, MemtoRegE_HU, RegWriteE_HU, RegWriteM_HU, RegWriteW_HU);
input clk, reset, RegWriteD, MemtoRegD, MemWriteD, ALUSrcD, RegDstD, JumpD, BranchD, StallF, StallD, ForwardAD, ForwardBD, FlushE, ForwardAE, ForwardBE;
input [2:0] ALUControlD;
output [5:0] Op, Funct;
output [4:0] RsD_HU, RtD_HU, RsE_HU, RtE_HU, WriteRegE_HU, WriteRegM_HU, WriteRegW_HU;
output BranchD_HU, JumpD_HU, MemtoRegE_HU, RegWriteE_HU, RegWriteM_HU, RegWriteW_HU;
/***********************Variable Declaration*********************/
reg [31:0] PCF;
wire [31:0] newPC, PCF_wire, InstrF, PCPlus4F;

reg [31:0] InstrD, PCPlus4D;
wire [31:0] SignImmD, PCBranchD, PCJumpD, EqualSrcA, EqualSrcB, RD1D, RD2D;
wire CLRD, EqualD;
wire [4:0] RsD, RtD, RdD;
wire [1:0] PCSrcD = {JumpD, (BranchD & EqualD)};

reg RegWriteE, MemtoRegE, MemWriteE, ALUControlE, ALUSrcE, RegDstE;
reg [4:0] RsE, RtE, RdE;
reg [31:0] RD1E, RD2E, SignImmE;
wire CLRE;
wire [4:0] WriteRegE;
wire [31:0] SrcAE, OperandB, SrcBE, WriteDataE;

reg RegWriteM, MemtoRegM, MemWriteM;
reg [31:0] ALUOutM, WriteDataM;
reg [4:0] WriteRegM;
wire [31:0] ReadDataM;

reg RegWriteW, MemtoRegW;
reg [31:0] ReadDataW, ALUOutW;
reg [4:0] WriteRegW;
/***********************Instruction Fetch*********************/
assign PCPlus4F = PCF + 32'h4;
inst_mem instruction_memory(.A(PCF), .RD(InstrF));
MUX_32_3_1 mux1(.in_00(PCPlus4F), .in_01(PCBranchD), .in_10(PCJumpD), .sel(PCSrcD), .out(newPC));
always @(posedge clk or negedge reset)
    begin
        if(!reset) PCF <= 32'h0;
        else
            begin
                if(!StallF) PCF <= newPC;
            end
    end
always@(*) PCF = PCF_wire;
/**************************Register File***********************/
assign CLRD = PCSrcD[0] | PCSrcD[1];
assign Op = InstrD[31:26];
assign Funct = InstrD[5:0];
assign RsD = InstrD[25:21];
assign RtD = InstrD[20:16];
assign RdD = InstrD[15:11];
assign PCBranchD = {SignImmD[29:0], 2'b00} + PCPlus4D;
assign PCJumpD = {PCPlus4D[31:28], (InstrD[25:0] << 2)};
assign EqualD = (EqualSrcA == EqualSrcB ? 1:0);
assign RsD_HU = RsD;
assign RtD_HU = RtD;
assign BranchD_HU = BranchD;
assign JumpD_HU = JumpD;
Register_File register_file(.A1(InstrD[25:21]), .A2(InstrD[20:16]), .A3(WriteRegW), .WD3(ResultW), .WE3(RegWriteW), .RD1(RD1D), .RD2(RD2D), .CLK(clk), .RESET(reset));
SignExtend sign_extend(.x(InstrD[15:0]), .y(SignImmD));
MUX_2_1 mux2(.in_0(RD1D), .in_1(ALUOutM), .sel(ForwardAD), .out(EqualSrcA));
MUX_2_1 mux3(.in_0(RD2D), .in_1(ALUOutM), .sel(ForwardBD), .out(EqualSrcB));
always@(posedge clk)
    begin
        if(!StallD)
            begin
                InstrD <= InstrF;
                PCPlus4D <= PCPlus4F;
            end
        if(CLRD)
            begin
                InstrD <= 32'h0;
                PCPlus4D <= 32'h0;
            end
    end
/**************************Execution***************************/
assign CLRE = FlushE;
assign RsE_HU = RsE;
assign RtE_HU = RtE;
assign WriteDataE = OperandB;
assign MemtoRegE_HU = MemtoRegE;
assign RegWriteE_HU = RegWriteE;
MUX_5_2_1 mux4(.in_0(RtE), .in_1(RdE), .sel(RegDstE), .out(WriteRegE));
MUX_32_3_1 mux5(.in_00(RD1E), .in_01(ResultW), .in_10(ALUOutM), .sel(ForwardAE), .out(SrcAE));
MUX_32_3_1 mux6(.in_00(RD2E), .in_01(ResultW), .in_10(ALUOutM), .sel(ForwardBE), .out(OperandB));
MUX_2_1 mux7(.in_0(OperandB), .in_1(SignImmE), .sel(ALUSrcE), .out(SrcBE));
alu ALU(.A(srcAE), .B(srcBE), .ALU_sel(ALUControlE), .ALU_result(ALUoutE), .OF());
always@(posedge clk)
    begin
        if(CLRE)
            begin
                RegWriteE <= 0;
                MemWriteE <= 0;
                RsE <= 0;
                RtE <= 0;
                RdE <= 0;
            end
        else
            begin
                RegWriteE <= RegWriteD;
                MemtoRegE <= MemtoRegD;
                MemWriteE <= MemWriteD;
                ALUControlE <= ALUControlD;
                ALUSrcE <= ALUSrcD;
                RegDstE <= RegDstD;
                RD1E <= RD1D;
                RD2E <= RD2D;
                RsE <= RsD;
                RtE <= RtD;
                RdE <= RdD;
                SignImmE <= SignImmD;
            end
    end
/*****************************Memory****************************/
assign WriteRegM_HU = WriteRegM;
assign RegWriteM_HU = RegWriteM;
data_mem data_memory(.A(ALUoutM), .WD(WriteDataM), .WE(MemWriteM), .CLK(clk), .RD(ReadDataM));
always@(posedge clk)
    begin
        RegWriteM <= RegWriteE;
        MemtoRegM <= MemtoRegE;
        MemWriteM <= MemWriteE;
        ALUOutM <= ALUoutE;
        WriteDataM <= WriteDataE;
        WriteRegM <= WriteRegE;
    end
/*****************************Write Back****************************/
assign WriteRegW_HU = WriteRegW;
assign RegWriteW_HU = RegWriteW;
MUX_2_1 mux8(.in_0(ALUOutW), .in_1(ReadDataW), .sel(MemtoRegW), .out(ResultW));
always@(posedge clk)
    begin
        RegWriteW <= RegWriteM;
        MemtoRegW <= MemtoRegM;
        ReadDataW <= ReadDataM;
        ALUOutW <= ALUoutM;
        WriteRegW <= WriteRegM;
    end
endmodule