`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*本文件为MCU的data path模块设计文件
*/
//////////////////////////////////////////////////////////////////////////////////
module SignExtend(x, y);
input[15:0] x;
output [31:0] y;
assign y = {{16{x[15]}}, x};
endmodule


module is_equal(a, b, y);
input [31:0] a, b;
output y;
assign y = (a == b?1:0);
endmodule


module single_cycle_data_path(Op, Funct, ALUControl, ALUSrc, MemWrite, MemtoReg, RegWrite, Jump, Branch, RegDst, clk, reset);
input ALUSrc, MemWrite, MemtoReg, RegWrite, Jump, Branch, RegDst, clk, reset;
input [2:0] ALUControl;
output [5:0] Op, Funct;

reg [31:0] PCF, InstrD, newPC;
wire [31:0]InstrD_wire,newPC_wire;
wire [31:0] PCPlus4F;

wire [31:0] srcAD, srcBD, ResultW, PCPlus4D, PCBranchD, PCJumpD, JumpD, BranchD;
wire [15:0] SignImmD;
wire [1:0] PCSrcD;
wire RtD, RdD, EqualD;

wire [31:0] ReadDataW;
wire [31:0] ALUoutW;
wire [4:0] WriteRegW;

wire [31:0] srcAE, srcBE, ALUoutE, WriteDataE;
wire [15:0] SignImmE = SignImmD;
wire ALUsrcE, RtE, RdE, RegDstE, WriteRegE;

wire [31:0] WriteDataM, ALUoutM;
wire [31:0] ReadDataM;
wire [4:0] WriteRegM;

wire MemtoRegW = MemtoReg;

/***********************Instruction Fetch*********************/
assign PCPlus4F = PCF + 32'h0000_0004;
inst_mem instruction_memory(.A(PCF), .RD(InstrD_wire));
MUX_32_3_1 mul_32_3_1(.in_00(PCPlus4F), .in_01(PCBranchD), .in_10(PCJumpD), .sel(PCSrcD), .out(newPC_wire));

always@(*)
    begin
        InstrD<=InstrD_wire;
        newPC<=newPC_wire;
    end

always @(posedge clk or negedge reset)
    begin
        if(reset) PCF = 32'h0;
        else PCF = newPC;
    end
/**************************Register File***********************/
assign RtD = InstrD[20:16];
assign RdD = InstrD[15:11];
assign Op = InstrD[31:26];
assign Funct = InstrD[5:0];
assign PCPlus4D = PCPlus4F;
assign JumpD = Jump;
assign BranchD = Branch;
MUX_2_1 mux2_1_1(.in_0(srcBD), .in_1(SignImmE), .sel(ALUsrcE), .out(srcBE));
Register_File register_file(.A1(InstrD[25:21]), .A2(InstrD[20:16]), .A3(WriteRegW), .WD3(ResultW), .WE3(RegWrite), .RD1(srcAD), .RD2(srcBD), .CLK(clk), .RESET(reset));
is_equal equal(.a(srcAD), .b(srcBD), .y(EqualD));
SignExtend sign_extend(.x(InstrD[15:0]), .y(SignImmD));
assign PCBranchD = PCPlus4D + (SignImmD << 2);
assign PCJumpD = {PCPlus4D[31:28], (InstrD[25:0] << 2)};
assign PCSrcD = {JumpD, (BranchD & EqualD)};
/**************************Execution***************************/
assign RegDstE = RegDst;
assign RtE = RtD;
assign RdE = RdD;
MUX_5_2_1 mux_5_2_1(.in_0(RtE), .in_1(RdE), .sel(RegDstE), .out(WriteRegE));
assign srcAE = srcAD;
assign ALUsrcE = ALUSrc;
MUX_2_1 mux2_1_2(.in_0(srcBD), .in_1(SignImmE), .sel(ALUsrcE), .out(srcBE));
alu ALU(.A(srcAE), .B(srcBE), .ALU_sel(ALUControl), .ALU_result(ALUoutE), .OF());
assign WriteDataE = srcBD;
/*****************************Memory****************************/
assign WriteDataM = WriteDataE;
assign WriteRegM = WriteRegE;
wire MemWriteM = MemWrite;
data_mem data_memory(.A(ALUoutM), .WD(WriteDataM), .WE(MemWriteM), .CLK(clk), .RD(ReadDataM));
/*****************************Write Back****************************/
assign ReadDataW = ReadDataM;
assign ALUoutW = ALUoutM;
assign WriteRegW = WriteRegM;
assign MemtoRegW = MemtoReg;
MUX_2_1 mux2_1_3(.in_0(ALUoutW), .in_1(ReadDataW), .sel(MemtoRegW), .out(ResultW));
endmodule