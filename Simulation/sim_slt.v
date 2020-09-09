`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2020/09/09
// Description: slt的仿真文�?
//////////////////////////////////////////////////////////////////////////////////
module sim_for_slt();
reg [31:0] A, B;
wire [31:0] result;

comparator com1(.A(A),.B(B),.result(result));

initial
begin
A =32'h0000_0002;//+2
B = 32'h0000_0003;//+3
//result = 32'h0000_0006;

#20
A = 32'hFFFF_FFFF;//-1
B = 32'h0000_0003;//+3
//result = 32'hFFFF_FFFD;

#20
A = 32'hFFFF_FFF6;//-10
B = 32'hFFFF_FFF1;//-15
//result = 32'h0000_0096;

#20
A = 32'h0000_029D;//669
B = 32'h0000_03E4;//996
//result = 32'h000A_2AD4;

#20
A = 32'hFFFF_FF61;//-159
B = 32'h0000_0058;//88
//result = 32'hFFFF_C958;

#20
A = 32'h0000_03E4;//996
B = 32'h0000_029D;//669
//result = 32'h000A_2AD4;

#20
A = 32'h0000_0000;//0
B = 32'h0000_006F;//111
//result = 32'h0000_0000;
end
endmodule