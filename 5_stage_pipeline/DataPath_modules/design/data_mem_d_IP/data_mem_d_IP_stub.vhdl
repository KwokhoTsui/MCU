-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Sun Aug  9 17:12:31 2020
-- Host        : LAPTOP-4SNJPT7S running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               G:/vivado/MCU-5_stage_pipeline/MCU-5_stage_pipeline/5_stage_pipeline/DataPath_modules/design/data_mem_d_IP/data_mem_d_IP_stub.vhdl
-- Design      : data_mem_d_IP
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tlcpg236-2L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity data_mem_d_IP is
  Port ( 
    a : in STD_LOGIC_VECTOR ( 6 downto 0 );
    d : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end data_mem_d_IP;

architecture stub of data_mem_d_IP is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a[6:0],d[31:0],clk,we,spo[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dist_mem_gen_v8_0_12,Vivado 2018.3";
begin
end;
