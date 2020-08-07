`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
本文件为 Register_File 仿真文件
*/
//////////////////////////////////////////////////////////////////////////////////


module SIM_Register_File;
    reg [4:0]A1, A2, A3;
    reg CLK;    
    reg WE3;
    reg [31:0]WD3;

    wire [31:0]RD1,RD2;

    Register_File Register_File_init(
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .CLK(CLK),
    .WE3(WE3),
    .WD3(WD3),
    
    .RD1(RD1),
    .RD2(RD2)
    );
    
     initial
        begin
        CLK=1'b0;A1=5'h00;A2=5'h00;A3=5'h01;WD3=32'h0000_004D;WE3=1'b1;//首先写register初始化，writing data需要一个一个写，因此先写01地址的寄存器
        #10 CLK=1'b1;//时钟上升沿触发
        #10 CLK=1'b0;A1=5'h00;A2=5'h01;A3=5'h03;WD3=32'h0000_004D;WE3=1'b1;// 在03地址的寄器内写入数据
        #10 CLK=1'b1;//时钟上升沿触发
        #10 CLK=1'b0;A1=5'h00;A2=5'h03;A3=5'h06;WD3=32'd666;WE3=1'b1;//在06地址的寄器内写入数据
        #10 CLK=1'b1;//时钟上升沿触发
        #10 CLK=1'b0;WE3=1'b0;A2=5'h06;A1=5'h03;//地址为03,06的register把这些数据读出来
        #10 CLK=1'b1;//时钟上升沿触发
        
        #10 $stop;
        end
endmodule
