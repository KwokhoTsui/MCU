`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2020/09/09
// Description: 乘法器的仿真文件
//////////////////////////////////////////////////////////////////////////////////

module sim_for_mul();
reg [15:0] mul_a, mul_b;
wire [31:0] product;
booth_multiplier_16 multiplier(.real_x(mul_a), .real_y(mul_b), .product(product));

initial
begin
mul_a = 16'h0002;//+2
mul_b = 16'h0003;//+3
//product = 32'h0000_0006;

#20
mul_a = 16'hFFFF;//-1
mul_b = 16'h0003;//+3
//product = 32'hFFFF_FFFD;

#20
mul_a = 16'hFFF6;//-10
mul_b = 16'hFFF1;//-15
//product = 32'h0000_0096;

#20
mul_a = 16'h029D;//669
mul_b = 16'h03E4;//996
//product = 32'h000A_2AD4;

#20
mul_a = 16'hFF61;//-159
mul_b = 16'h0058;//88
//product = 32'hFFFF_C958;

#20
mul_a = 16'h03E4;//996
mul_b = 16'h029D;//669
//product = 32'h000A_2AD4;

#20
mul_a = 16'h0000;//0
mul_b = 16'h006F;//111
//product = 32'h0000_0000;
end
endmodule