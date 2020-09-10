`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2020/09/09
// Description: 乘法器的仿真文件(小数)
//////////////////////////////////////////////////////////////////////////////////

module sim_for_mul();
reg [15:0] mul_a, mul_b;
wire [31:0] product;
booth_multiplier_16 multiplier(.real_x(mul_a), .real_y(mul_b), .product(product));

initial
begin
mul_a = 16'hFCD0;//
mul_b = 16'h0876;//

#20
mul_a = 16'h0000;//
mul_b = 16'h0000;//

end
endmodule