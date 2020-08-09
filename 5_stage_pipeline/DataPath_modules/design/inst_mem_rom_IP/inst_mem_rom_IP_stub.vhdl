-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Sun Aug  9 17:36:33 2020
-- Host        : LAPTOP-4SNJPT7S running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               G:/vivado/MCU-5_stage_pipeline/MCU-5_stage_pipeline/5_stage_pipeline/DataPath_modules/design/inst_mem_rom_IP/inst_mem_rom_IP_stub.vhdl
-- Design      : inst_mem_rom_IP
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tlcpg236-2L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inst_mem_rom_IP is
  Port ( 
    a : in STD_LOGIC_VECTOR ( 5 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end inst_mem_rom_IP;

architecture stub of inst_mem_rom_IP is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a[5:0],spo[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dist_mem_gen_v8_0_12,Vivado 2018.3";
begin
end;
