-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Tue Aug  4 22:06:18 2020
-- Host        : DESKTOP-PIGH0UD running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               F:/UESTC_study/verilog/mcu_1/mcu_1.srcs/sources_1/ip/inst_mem_rom_IP/inst_mem_rom_IP_stub.vhdl
-- Design      : inst_mem_rom_IP
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35ticpg236-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inst_mem_rom_IP is
  Port ( 
    a : in STD_LOGIC_VECTOR ( 6 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end inst_mem_rom_IP;

architecture stub of inst_mem_rom_IP is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a[6:0],spo[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dist_mem_gen_v8_0_13,Vivado 2019.2";
begin
end;
