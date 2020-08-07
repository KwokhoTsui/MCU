// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Aug  4 22:06:18 2020
// Host        : DESKTOP-PIGH0UD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               F:/UESTC_study/verilog/mcu_1/mcu_1.srcs/sources_1/ip/inst_mem_rom_IP/inst_mem_rom_IP_stub.v
// Design      : inst_mem_rom_IP
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35ticpg236-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2019.2" *)
module inst_mem_rom_IP(a, spo)
/* synthesis syn_black_box black_box_pad_pin="a[6:0],spo[31:0]" */;
  input [6:0]a;
  output [31:0]spo;
endmodule
