`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////////
/*���ļ�ΪMCU��data pathģ������ļ���5����ˮ��
���������ͣ����ֱ�����ĩβ����һ����д��ĸ��F��D��E��M��W�ֱ��Ӧ�弶��ˮ�ı�������
            ����input/output������֮�⣬����������������������Variable Declaration
            �����ҵ����ò��ֱ����з�Ϊ5�����֣���Ӧ5����ˮ��������ˮ��Ӧ�ı������ڶ�Ӧ
            ���֡�
            �����������Op��Funct֮�⣬����������_HU��׺����ʾ���������Hazard_Unit�ı���
������ˮ���룺������ˮ�Ĵ��붼д�ڶ�Ӧ�����·���ÿһ���������з�ʽ���£�
            ����assign��䡢����ģ�������䡢����always@���
*/
////////////////////////////////////////////////////////////////////////////////////////
module SignExtend(x, y);
input[15:0] x;
output [31:0] y;
assign y = {{16{x[15]}}, x};
endmodule


module five_pipeline_data_path(Op, Funct, RsD_HU, RtD_HU, RsE_HU, RtE_HU, WriteRegE_HU, WriteRegM_HU, WriteRegW_HU, clk, reset, RegWriteD, MemtoRegD, MemWriteD, ALUSrcD, RegDstD, JumpD, BranchD, ALUControlD, StallF, StallD, ForwardAD, ForwardBD, FlushE, ForwardAE, ForwardBE, BranchD_HU, JumpD_HU, MemtoRegE_HU, RegWriteE_HU, RegWriteM_HU, RegWriteW_HU);
input clk, reset, RegWriteD, MemtoRegD, MemWriteD, ALUSrcD,BranchD, RegDstD, JumpD,StallF, StallD, ForwardAD, ForwardBD, FlushE;
input [1:0] ForwardAE, ForwardBE;
input [2:0] ALUControlD;
output [5:0] Op, Funct;
output [4:0] RsD_HU, RtD_HU, RsE_HU, RtE_HU, WriteRegE_HU, WriteRegM_HU, WriteRegW_HU;
output BranchD_HU, JumpD_HU, MemtoRegE_HU, RegWriteE_HU, RegWriteM_HU, RegWriteW_HU;
/***********************Variable Declaration*********************/
reg [31:0] PCF;
wire [31:0] newPC, InstrF, PCPlus4F;

reg [31:0] InstrD, PCPlus4D;
wire [31:0] SignImmD, PCBranchD, PCJumpD, EqualSrcA, EqualSrcB, RD1D, RD2D;
wire CLRD;
wire [4:0] RsD, RtD, RdD;
wire [1:0] PCSrcD;
wire EqualD;

reg RegWriteE, MemtoRegE, MemWriteE, ALUSrcE, RegDstE;
reg [4:0] RsE, RtE, RdE;
reg [31:0] RD1E, RD2E, SignImmE;
reg [2:0]ALUControlE;
wire CLRE;
wire [4:0] WriteRegE;
wire [31:0] SrcAE, OperandB, SrcBE, WriteDataE;
wire [31:0]ALUoutE;

reg RegWriteM, MemtoRegM, MemWriteM;
reg [31:0] ALUOutM, WriteDataM;
reg [4:0] WriteRegM;
wire [31:0] ReadDataM;
wire [31:0]ALUoutM_wire;

reg RegWriteW, MemtoRegW;
reg [31:0] ReadDataW, ALUOutW;
reg [4:0] WriteRegW;
wire [31:0]ResultW;
/***********************Fetch*********************/
always @(posedge clk or negedge reset)
    begin
        if(!reset) PCF <= 32'h0;
        else
            begin
                if(!StallF) PCF <= newPC;
            end
    end
assign PCPlus4F = PCF + 32'h4;
assign CLRD = PCSrcD[1]|PCSrcD[0];
inst_mem instruction_memory(.A(PCF), .RD(InstrF));
MUX_32_3_1 mux1(.in_00(PCPlus4F), .in_01(PCBranchD), .in_10(PCJumpD), .sel(PCSrcD), .out(newPC));


/**************************Decode***********************/
always@(posedge clk)
    begin
        if (!reset)begin
                InstrD <= 32'h0;
                PCPlus4D <= 32'h0;
        end
        else if(!StallD)
            begin
                InstrD <= InstrF;
                PCPlus4D <= PCPlus4F;
            end
        else if(CLRD)
            begin
                InstrD <= 32'h0;
                PCPlus4D <= 32'h0;
            end
    end
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
assign PCSrcD = {JumpD, (BranchD & EqualD)};
Register_File register_file(.A1(InstrD[25:21]), .A2(InstrD[20:16]), .A3(WriteRegW), .WD3(ResultW), .WE3(RegWriteW), .RD1(RD1D), .RD2(RD2D), .CLK(clk), .RESET(reset));
SignExtend sign_extend(.x(InstrD[15:0]), .y(SignImmD));
MUX_2_1 mux2(.in_0(RD1D), .in_1(ALUOutM), .sel(ForwardAD), .out(EqualSrcA));
MUX_2_1 mux3(.in_0(RD2D), .in_1(ALUOutM), .sel(ForwardBD), .out(EqualSrcB));
/*assign PCSrcD[0] = BranchD[1]?0:(BranchD[0]?(EqualSrcA == EqualSrcB):(EqualSrcA != EqualSrcB));
assign PCSrcD[1] = JumpD;*/
/*always@(posedge clk)
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
    end*/
/**************************Execution***************************/
always@(posedge clk)
    begin
        if((!reset) || CLRE) begin
                RegWriteE <= 0;
                MemtoRegE<=0;
                MemWriteE <= 0;
                ALUControlE<=0;
                ALUSrcE<=0;
                RegDstE<=0;
                RD1E<=0;
                RD2E<=0;
                SignImmE <= 0;
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
alu ALU(.A(SrcAE), .B(SrcBE), .ALU_sel(ALUControlE), .ALU_result(ALUoutE), .OF());

/*****************************Memory****************************/
always@(posedge clk)
    begin
        RegWriteM <= RegWriteE;
        MemtoRegM <= MemtoRegE;
        MemWriteM <= MemWriteE;
        ALUOutM <= ALUoutE;
        WriteDataM <= WriteDataE;
        WriteRegM <= WriteRegE;
    end
assign WriteRegM_HU = WriteRegM;
assign RegWriteM_HU = RegWriteM;
assign ALUoutM_wire = ALUOutM;
data_mem data_memory(.A(ALUoutM_wire), .WD(WriteDataM), .WE(MemWriteM), .CLK(clk), .RD(ReadDataM));

/*****************************Write Back****************************/
assign WriteRegW_HU = WriteRegW;
assign RegWriteW_HU = RegWriteW;
MUX_2_1 mux8(.in_0(ALUOutW), .in_1(ReadDataW), .sel(MemtoRegW), .out(ResultW));
always@(posedge clk)
    begin
        RegWriteW <= RegWriteM;
        MemtoRegW <= MemtoRegM;
        ReadDataW <= ReadDataM;
        ALUOutW <= ALUOutM;
        WriteRegW <= WriteRegM;
    end
endmodule