`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 描述: 本文件为3-2压缩器和4-2压缩器的实现
// 子模块: 
// HA：半加器
// compressori_2_j：接收i个加数，输出2个输出（进位和求和）的j位加法器
// 注：compressor3_2_32: 仅适用于本乘法器
//////////////////////////////////////////////////////////////////////////////////

module HA(x, y, s, cout);
input x, y;
output s, cout;
assign s = x ^ y;
assign cout = x & y;
endmodule


module compressor4_2_1(x0, x1, x2, x3, cin, cout, carry, sum);
input x0, x1, x2, x3, cin;
wire a, b;//辅助变量；
output cout, carry, sum;
assign a = ~((x0 & x1) | (x2 & x3)); //辅助变量
assign b = (x0 ^ x1) ^ (x2 ^ x3); //辅助变量
assign cout = (x0 | x1) & (x2 | x3);
assign sum = b ^ cin;
assign carry = (~(a | b)) | (b & cin);
endmodule


module compressor4_2_24(x0, x1, x2, x3, cout, carry, sum);
input [23:0] x0, x1, x2, x3;
output cout;
output [23:0] carry, sum;

wire [23:0] middle_carry;

assign cout = middle_carry[23];
compressor4_2_1 com0 (.x0(x0[ 0]), .x1(x1[ 0]), .x2(x2[ 0]), .x3(x3[ 0]), .cin(            1'b0), .cout(middle_carry[ 0]), .carry(carry[ 0]), .sum(sum[ 0]));
compressor4_2_1 com1 (.x0(x0[ 1]), .x1(x1[ 1]), .x2(x2[ 1]), .x3(x3[ 1]), .cin(middle_carry[ 0]), .cout(middle_carry[ 1]), .carry(carry[ 1]), .sum(sum[ 1]));
compressor4_2_1 com2 (.x0(x0[ 2]), .x1(x1[ 2]), .x2(x2[ 2]), .x3(x3[ 2]), .cin(middle_carry[ 1]), .cout(middle_carry[ 2]), .carry(carry[ 2]), .sum(sum[ 2]));
compressor4_2_1 com3 (.x0(x0[ 3]), .x1(x1[ 3]), .x2(x2[ 3]), .x3(x3[ 3]), .cin(middle_carry[ 2]), .cout(middle_carry[ 3]), .carry(carry[ 3]), .sum(sum[ 3]));
compressor4_2_1 com4 (.x0(x0[ 4]), .x1(x1[ 4]), .x2(x2[ 4]), .x3(x3[ 4]), .cin(middle_carry[ 3]), .cout(middle_carry[ 4]), .carry(carry[ 4]), .sum(sum[ 4]));
compressor4_2_1 com5 (.x0(x0[ 5]), .x1(x1[ 5]), .x2(x2[ 5]), .x3(x3[ 5]), .cin(middle_carry[ 4]), .cout(middle_carry[ 5]), .carry(carry[ 5]), .sum(sum[ 5]));
compressor4_2_1 com6 (.x0(x0[ 6]), .x1(x1[ 6]), .x2(x2[ 6]), .x3(x3[ 6]), .cin(middle_carry[ 5]), .cout(middle_carry[ 6]), .carry(carry[ 6]), .sum(sum[ 6]));
compressor4_2_1 com7 (.x0(x0[ 7]), .x1(x1[ 7]), .x2(x2[ 7]), .x3(x3[ 7]), .cin(middle_carry[ 6]), .cout(middle_carry[ 7]), .carry(carry[ 7]), .sum(sum[ 7]));
compressor4_2_1 com8 (.x0(x0[ 8]), .x1(x1[ 8]), .x2(x2[ 8]), .x3(x3[ 8]), .cin(middle_carry[ 7]), .cout(middle_carry[ 8]), .carry(carry[ 8]), .sum(sum[ 8]));
compressor4_2_1 com9 (.x0(x0[ 9]), .x1(x1[ 9]), .x2(x2[ 9]), .x3(x3[ 9]), .cin(middle_carry[ 8]), .cout(middle_carry[ 9]), .carry(carry[ 9]), .sum(sum[ 9]));
compressor4_2_1 com10(.x0(x0[10]), .x1(x1[10]), .x2(x2[10]), .x3(x3[10]), .cin(middle_carry[ 9]), .cout(middle_carry[10]), .carry(carry[10]), .sum(sum[10]));
compressor4_2_1 com11(.x0(x0[11]), .x1(x1[11]), .x2(x2[11]), .x3(x3[11]), .cin(middle_carry[10]), .cout(middle_carry[11]), .carry(carry[11]), .sum(sum[11]));
compressor4_2_1 com12(.x0(x0[12]), .x1(x1[12]), .x2(x2[12]), .x3(x3[12]), .cin(middle_carry[11]), .cout(middle_carry[12]), .carry(carry[12]), .sum(sum[12]));
compressor4_2_1 com13(.x0(x0[13]), .x1(x1[13]), .x2(x2[13]), .x3(x3[13]), .cin(middle_carry[12]), .cout(middle_carry[13]), .carry(carry[13]), .sum(sum[13]));
compressor4_2_1 com14(.x0(x0[14]), .x1(x1[14]), .x2(x2[14]), .x3(x3[14]), .cin(middle_carry[13]), .cout(middle_carry[14]), .carry(carry[14]), .sum(sum[14]));
compressor4_2_1 com15(.x0(x0[15]), .x1(x1[15]), .x2(x2[15]), .x3(x3[15]), .cin(middle_carry[14]), .cout(middle_carry[15]), .carry(carry[15]), .sum(sum[15]));
compressor4_2_1 com16(.x0(x0[16]), .x1(x1[16]), .x2(x2[16]), .x3(x3[16]), .cin(middle_carry[15]), .cout(middle_carry[16]), .carry(carry[16]), .sum(sum[16]));
compressor4_2_1 com17(.x0(x0[17]), .x1(x1[17]), .x2(x2[17]), .x3(x3[17]), .cin(middle_carry[16]), .cout(middle_carry[17]), .carry(carry[17]), .sum(sum[17]));
compressor4_2_1 com18(.x0(x0[18]), .x1(x1[18]), .x2(x2[18]), .x3(x3[18]), .cin(middle_carry[17]), .cout(middle_carry[18]), .carry(carry[18]), .sum(sum[18]));
compressor4_2_1 com19(.x0(x0[19]), .x1(x1[19]), .x2(x2[19]), .x3(x3[19]), .cin(middle_carry[18]), .cout(middle_carry[19]), .carry(carry[19]), .sum(sum[19]));
compressor4_2_1 com20(.x0(x0[20]), .x1(x1[20]), .x2(x2[20]), .x3(x3[20]), .cin(middle_carry[19]), .cout(middle_carry[20]), .carry(carry[20]), .sum(sum[20]));
compressor4_2_1 com21(.x0(x0[21]), .x1(x1[21]), .x2(x2[21]), .x3(x3[21]), .cin(middle_carry[20]), .cout(middle_carry[21]), .carry(carry[21]), .sum(sum[21]));
compressor4_2_1 com22(.x0(x0[22]), .x1(x1[22]), .x2(x2[22]), .x3(x3[22]), .cin(middle_carry[21]), .cout(middle_carry[22]), .carry(carry[22]), .sum(sum[22]));
compressor4_2_1 com23(.x0(x0[23]), .x1(x1[23]), .x2(x2[23]), .x3(x3[23]), .cin(middle_carry[22]), .cout(middle_carry[23]), .carry(carry[23]), .sum(sum[23]));
endmodule



module compressor4_2_25(x0, x1, x2, x3, cout, carry, sum);
input [24:0] x0, x1, x2, x3;
output cout;
output [24:0] carry, sum;

wire [24:0] middle_carry;

assign cout = middle_carry[24];
compressor4_2_1 com0 (.x0(x0[ 0]), .x1(x1[ 0]), .x2(x2[ 0]), .x3(x3[ 0]), .cin(            1'b0), .cout(middle_carry[ 0]), .carry(carry[ 0]), .sum(sum[ 0]));
compressor4_2_1 com1 (.x0(x0[ 1]), .x1(x1[ 1]), .x2(x2[ 1]), .x3(x3[ 1]), .cin(middle_carry[ 0]), .cout(middle_carry[ 1]), .carry(carry[ 1]), .sum(sum[ 1]));
compressor4_2_1 com2 (.x0(x0[ 2]), .x1(x1[ 2]), .x2(x2[ 2]), .x3(x3[ 2]), .cin(middle_carry[ 1]), .cout(middle_carry[ 2]), .carry(carry[ 2]), .sum(sum[ 2]));
compressor4_2_1 com3 (.x0(x0[ 3]), .x1(x1[ 3]), .x2(x2[ 3]), .x3(x3[ 3]), .cin(middle_carry[ 2]), .cout(middle_carry[ 3]), .carry(carry[ 3]), .sum(sum[ 3]));
compressor4_2_1 com4 (.x0(x0[ 4]), .x1(x1[ 4]), .x2(x2[ 4]), .x3(x3[ 4]), .cin(middle_carry[ 3]), .cout(middle_carry[ 4]), .carry(carry[ 4]), .sum(sum[ 4]));
compressor4_2_1 com5 (.x0(x0[ 5]), .x1(x1[ 5]), .x2(x2[ 5]), .x3(x3[ 5]), .cin(middle_carry[ 4]), .cout(middle_carry[ 5]), .carry(carry[ 5]), .sum(sum[ 5]));
compressor4_2_1 com6 (.x0(x0[ 6]), .x1(x1[ 6]), .x2(x2[ 6]), .x3(x3[ 6]), .cin(middle_carry[ 5]), .cout(middle_carry[ 6]), .carry(carry[ 6]), .sum(sum[ 6]));
compressor4_2_1 com7 (.x0(x0[ 7]), .x1(x1[ 7]), .x2(x2[ 7]), .x3(x3[ 7]), .cin(middle_carry[ 6]), .cout(middle_carry[ 7]), .carry(carry[ 7]), .sum(sum[ 7]));
compressor4_2_1 com8 (.x0(x0[ 8]), .x1(x1[ 8]), .x2(x2[ 8]), .x3(x3[ 8]), .cin(middle_carry[ 7]), .cout(middle_carry[ 8]), .carry(carry[ 8]), .sum(sum[ 8]));
compressor4_2_1 com9 (.x0(x0[ 9]), .x1(x1[ 9]), .x2(x2[ 9]), .x3(x3[ 9]), .cin(middle_carry[ 8]), .cout(middle_carry[ 9]), .carry(carry[ 9]), .sum(sum[ 9]));
compressor4_2_1 com10(.x0(x0[10]), .x1(x1[10]), .x2(x2[10]), .x3(x3[10]), .cin(middle_carry[ 9]), .cout(middle_carry[10]), .carry(carry[10]), .sum(sum[10]));
compressor4_2_1 com11(.x0(x0[11]), .x1(x1[11]), .x2(x2[11]), .x3(x3[11]), .cin(middle_carry[10]), .cout(middle_carry[11]), .carry(carry[11]), .sum(sum[11]));
compressor4_2_1 com12(.x0(x0[12]), .x1(x1[12]), .x2(x2[12]), .x3(x3[12]), .cin(middle_carry[11]), .cout(middle_carry[12]), .carry(carry[12]), .sum(sum[12]));
compressor4_2_1 com13(.x0(x0[13]), .x1(x1[13]), .x2(x2[13]), .x3(x3[13]), .cin(middle_carry[12]), .cout(middle_carry[13]), .carry(carry[13]), .sum(sum[13]));
compressor4_2_1 com14(.x0(x0[14]), .x1(x1[14]), .x2(x2[14]), .x3(x3[14]), .cin(middle_carry[13]), .cout(middle_carry[14]), .carry(carry[14]), .sum(sum[14]));
compressor4_2_1 com15(.x0(x0[15]), .x1(x1[15]), .x2(x2[15]), .x3(x3[15]), .cin(middle_carry[14]), .cout(middle_carry[15]), .carry(carry[15]), .sum(sum[15]));
compressor4_2_1 com16(.x0(x0[16]), .x1(x1[16]), .x2(x2[16]), .x3(x3[16]), .cin(middle_carry[15]), .cout(middle_carry[16]), .carry(carry[16]), .sum(sum[16]));
compressor4_2_1 com17(.x0(x0[17]), .x1(x1[17]), .x2(x2[17]), .x3(x3[17]), .cin(middle_carry[16]), .cout(middle_carry[17]), .carry(carry[17]), .sum(sum[17]));
compressor4_2_1 com18(.x0(x0[18]), .x1(x1[18]), .x2(x2[18]), .x3(x3[18]), .cin(middle_carry[17]), .cout(middle_carry[18]), .carry(carry[18]), .sum(sum[18]));
compressor4_2_1 com19(.x0(x0[19]), .x1(x1[19]), .x2(x2[19]), .x3(x3[19]), .cin(middle_carry[18]), .cout(middle_carry[19]), .carry(carry[19]), .sum(sum[19]));
compressor4_2_1 com20(.x0(x0[20]), .x1(x1[20]), .x2(x2[20]), .x3(x3[20]), .cin(middle_carry[19]), .cout(middle_carry[20]), .carry(carry[20]), .sum(sum[20]));
compressor4_2_1 com21(.x0(x0[21]), .x1(x1[21]), .x2(x2[21]), .x3(x3[21]), .cin(middle_carry[20]), .cout(middle_carry[21]), .carry(carry[21]), .sum(sum[21]));
compressor4_2_1 com22(.x0(x0[22]), .x1(x1[22]), .x2(x2[22]), .x3(x3[22]), .cin(middle_carry[21]), .cout(middle_carry[22]), .carry(carry[22]), .sum(sum[22]));
compressor4_2_1 com23(.x0(x0[23]), .x1(x1[23]), .x2(x2[23]), .x3(x3[23]), .cin(middle_carry[22]), .cout(middle_carry[23]), .carry(carry[23]), .sum(sum[23]));
compressor4_2_1 com24(.x0(x0[24]), .x1(x1[24]), .x2(x2[24]), .x3(x3[24]), .cin(middle_carry[23]), .cout(middle_carry[24]), .carry(carry[24]), .sum(sum[24]));
endmodule


module compressor4_2_32(x0, x1, x2, x3, cout, carry, sum);
input [31:0] x0, x1, x2, x3;
output cout;
output [31:0] carry, sum;

wire [31:0] middle_carry;

assign cout = middle_carry[31];
compressor4_2_1 com0 (.x0(x0[ 0]), .x1(x1[ 0]), .x2(x2[ 0]), .x3(x3[ 0]), .cin(            1'b0), .cout(middle_carry[ 0]), .carry(carry[ 0]), .sum(sum[ 0]));
compressor4_2_1 com1 (.x0(x0[ 1]), .x1(x1[ 1]), .x2(x2[ 1]), .x3(x3[ 1]), .cin(middle_carry[ 0]), .cout(middle_carry[ 1]), .carry(carry[ 1]), .sum(sum[ 1]));
compressor4_2_1 com2 (.x0(x0[ 2]), .x1(x1[ 2]), .x2(x2[ 2]), .x3(x3[ 2]), .cin(middle_carry[ 1]), .cout(middle_carry[ 2]), .carry(carry[ 2]), .sum(sum[ 2]));
compressor4_2_1 com3 (.x0(x0[ 3]), .x1(x1[ 3]), .x2(x2[ 3]), .x3(x3[ 3]), .cin(middle_carry[ 2]), .cout(middle_carry[ 3]), .carry(carry[ 3]), .sum(sum[ 3]));
compressor4_2_1 com4 (.x0(x0[ 4]), .x1(x1[ 4]), .x2(x2[ 4]), .x3(x3[ 4]), .cin(middle_carry[ 3]), .cout(middle_carry[ 4]), .carry(carry[ 4]), .sum(sum[ 4]));
compressor4_2_1 com5 (.x0(x0[ 5]), .x1(x1[ 5]), .x2(x2[ 5]), .x3(x3[ 5]), .cin(middle_carry[ 4]), .cout(middle_carry[ 5]), .carry(carry[ 5]), .sum(sum[ 5]));
compressor4_2_1 com6 (.x0(x0[ 6]), .x1(x1[ 6]), .x2(x2[ 6]), .x3(x3[ 6]), .cin(middle_carry[ 5]), .cout(middle_carry[ 6]), .carry(carry[ 6]), .sum(sum[ 6]));
compressor4_2_1 com7 (.x0(x0[ 7]), .x1(x1[ 7]), .x2(x2[ 7]), .x3(x3[ 7]), .cin(middle_carry[ 6]), .cout(middle_carry[ 7]), .carry(carry[ 7]), .sum(sum[ 7]));
compressor4_2_1 com8 (.x0(x0[ 8]), .x1(x1[ 8]), .x2(x2[ 8]), .x3(x3[ 8]), .cin(middle_carry[ 7]), .cout(middle_carry[ 8]), .carry(carry[ 8]), .sum(sum[ 8]));
compressor4_2_1 com9 (.x0(x0[ 9]), .x1(x1[ 9]), .x2(x2[ 9]), .x3(x3[ 9]), .cin(middle_carry[ 8]), .cout(middle_carry[ 9]), .carry(carry[ 9]), .sum(sum[ 9]));
compressor4_2_1 com10(.x0(x0[10]), .x1(x1[10]), .x2(x2[10]), .x3(x3[10]), .cin(middle_carry[ 9]), .cout(middle_carry[10]), .carry(carry[10]), .sum(sum[10]));
compressor4_2_1 com11(.x0(x0[11]), .x1(x1[11]), .x2(x2[11]), .x3(x3[11]), .cin(middle_carry[10]), .cout(middle_carry[11]), .carry(carry[11]), .sum(sum[11]));
compressor4_2_1 com12(.x0(x0[12]), .x1(x1[12]), .x2(x2[12]), .x3(x3[12]), .cin(middle_carry[11]), .cout(middle_carry[12]), .carry(carry[12]), .sum(sum[12]));
compressor4_2_1 com13(.x0(x0[13]), .x1(x1[13]), .x2(x2[13]), .x3(x3[13]), .cin(middle_carry[12]), .cout(middle_carry[13]), .carry(carry[13]), .sum(sum[13]));
compressor4_2_1 com14(.x0(x0[14]), .x1(x1[14]), .x2(x2[14]), .x3(x3[14]), .cin(middle_carry[13]), .cout(middle_carry[14]), .carry(carry[14]), .sum(sum[14]));
compressor4_2_1 com15(.x0(x0[15]), .x1(x1[15]), .x2(x2[15]), .x3(x3[15]), .cin(middle_carry[14]), .cout(middle_carry[15]), .carry(carry[15]), .sum(sum[15]));
compressor4_2_1 com16(.x0(x0[16]), .x1(x1[16]), .x2(x2[16]), .x3(x3[16]), .cin(middle_carry[15]), .cout(middle_carry[16]), .carry(carry[16]), .sum(sum[16]));
compressor4_2_1 com17(.x0(x0[17]), .x1(x1[17]), .x2(x2[17]), .x3(x3[17]), .cin(middle_carry[16]), .cout(middle_carry[17]), .carry(carry[17]), .sum(sum[17]));
compressor4_2_1 com18(.x0(x0[18]), .x1(x1[18]), .x2(x2[18]), .x3(x3[18]), .cin(middle_carry[17]), .cout(middle_carry[18]), .carry(carry[18]), .sum(sum[18]));
compressor4_2_1 com19(.x0(x0[19]), .x1(x1[19]), .x2(x2[19]), .x3(x3[19]), .cin(middle_carry[18]), .cout(middle_carry[19]), .carry(carry[19]), .sum(sum[19]));
compressor4_2_1 com20(.x0(x0[20]), .x1(x1[20]), .x2(x2[20]), .x3(x3[20]), .cin(middle_carry[19]), .cout(middle_carry[20]), .carry(carry[20]), .sum(sum[20]));
compressor4_2_1 com21(.x0(x0[21]), .x1(x1[21]), .x2(x2[21]), .x3(x3[21]), .cin(middle_carry[20]), .cout(middle_carry[21]), .carry(carry[21]), .sum(sum[21]));
compressor4_2_1 com22(.x0(x0[22]), .x1(x1[22]), .x2(x2[22]), .x3(x3[22]), .cin(middle_carry[21]), .cout(middle_carry[22]), .carry(carry[22]), .sum(sum[22]));
compressor4_2_1 com23(.x0(x0[23]), .x1(x1[23]), .x2(x2[23]), .x3(x3[23]), .cin(middle_carry[22]), .cout(middle_carry[23]), .carry(carry[23]), .sum(sum[23]));
compressor4_2_1 com24(.x0(x0[24]), .x1(x1[24]), .x2(x2[24]), .x3(x3[24]), .cin(middle_carry[23]), .cout(middle_carry[24]), .carry(carry[24]), .sum(sum[24]));
compressor4_2_1 com25(.x0(x0[25]), .x1(x1[25]), .x2(x2[25]), .x3(x3[25]), .cin(middle_carry[24]), .cout(middle_carry[25]), .carry(carry[25]), .sum(sum[25]));
compressor4_2_1 com26(.x0(x0[26]), .x1(x1[26]), .x2(x2[26]), .x3(x3[26]), .cin(middle_carry[25]), .cout(middle_carry[26]), .carry(carry[26]), .sum(sum[26]));
compressor4_2_1 com27(.x0(x0[27]), .x1(x1[27]), .x2(x2[27]), .x3(x3[27]), .cin(middle_carry[26]), .cout(middle_carry[27]), .carry(carry[27]), .sum(sum[27]));
compressor4_2_1 com28(.x0(x0[28]), .x1(x1[28]), .x2(x2[28]), .x3(x3[28]), .cin(middle_carry[27]), .cout(middle_carry[28]), .carry(carry[28]), .sum(sum[28]));
compressor4_2_1 com29(.x0(x0[29]), .x1(x1[29]), .x2(x2[29]), .x3(x3[29]), .cin(middle_carry[28]), .cout(middle_carry[29]), .carry(carry[29]), .sum(sum[29]));
compressor4_2_1 com30(.x0(x0[30]), .x1(x1[30]), .x2(x2[30]), .x3(x3[30]), .cin(middle_carry[29]), .cout(middle_carry[30]), .carry(carry[30]), .sum(sum[30]));
compressor4_2_1 com31(.x0(x0[31]), .x1(x1[31]), .x2(x2[31]), .x3(x3[31]), .cin(middle_carry[30]), .cout(middle_carry[31]), .carry(carry[31]), .sum(sum[31]));

endmodule


module compressor3_2_32(x0, x1, x2, carry, sum);
input [31:0] x0, x1, x2;
output [31:0] carry, sum;

assign sum[0] = x0[0];
assign carry[0] = 1'b0;
HA half_adder1 (.x(x0[ 1]), .y(x1[ 1]),               .s(sum[ 1]), .cout(carry[ 1]));
HA half_adder2 (.x(x0[ 2]), .y(x1[ 2]),               .s(sum[ 2]), .cout(carry[ 2]));
HA half_adder3 (.x(x0[ 3]), .y(x1[ 3]),               .s(sum[ 3]), .cout(carry[ 3]));
HA half_adder4 (.x(x0[ 4]), .y(x1[ 4]),               .s(sum[ 4]), .cout(carry[ 4]));
HA half_adder5 (.x(x0[ 5]), .y(x1[ 5]),               .s(sum[ 5]), .cout(carry[ 5]));
HA half_adder6 (.x(x0[ 6]), .y(x1[ 6]),               .s(sum[ 6]), .cout(carry[ 6]));
HA half_adder7 (.x(x0[ 7]), .y(x1[ 7]),               .s(sum[ 7]), .cout(carry[ 7]));
HA half_adder8 (.x(x0[ 8]), .y(x1[ 8]),               .s(sum[ 8]), .cout(carry[ 8]));
HA half_adder9 (.x(x0[ 9]), .y(x1[ 9]),               .s(sum[ 9]), .cout(carry[ 9]));
HA half_adder10(.x(x0[10]), .y(x1[10]),               .s(sum[10]), .cout(carry[10]));
HA half_adder11(.x(x0[11]), .y(x1[11]),               .s(sum[11]), .cout(carry[11]));
HA half_adder12(.x(x0[12]), .y(x1[12]),               .s(sum[12]), .cout(carry[12]));
HA half_adder13(.x(x0[13]), .y(x1[13]),               .s(sum[13]), .cout(carry[13]));
HA half_adder14(.x(x0[14]), .y(x1[14]),               .s(sum[14]), .cout(carry[14]));
HA half_adder15(.x(x0[15]), .y(x1[15]),               .s(sum[15]), .cout(carry[15]));
FA full_adder1 (.x(x0[16]), .y(x1[16]), .cin(x2[16]), .s(sum[16]), .cout(carry[16]));
FA full_adder2 (.x(x0[17]), .y(x1[17]), .cin(x2[17]), .s(sum[17]), .cout(carry[17]));
FA full_adder3 (.x(x0[18]), .y(x1[18]), .cin(x2[18]), .s(sum[18]), .cout(carry[18]));
FA full_adder4 (.x(x0[19]), .y(x1[19]), .cin(x2[19]), .s(sum[19]), .cout(carry[19]));
FA full_adder5 (.x(x0[20]), .y(x1[20]), .cin(x2[20]), .s(sum[20]), .cout(carry[20]));
FA full_adder6 (.x(x0[21]), .y(x1[21]), .cin(x2[21]), .s(sum[21]), .cout(carry[21]));
FA full_adder7 (.x(x0[22]), .y(x1[22]), .cin(x2[22]), .s(sum[22]), .cout(carry[22]));
FA full_adder8 (.x(x0[23]), .y(x1[23]), .cin(x2[23]), .s(sum[23]), .cout(carry[23]));
FA full_adder9 (.x(x0[24]), .y(x1[24]), .cin(x2[24]), .s(sum[24]), .cout(carry[24]));
FA full_adder10(.x(x0[25]), .y(x1[25]), .cin(x2[25]), .s(sum[25]), .cout(carry[25]));
FA full_adder11(.x(x0[26]), .y(x1[26]), .cin(x2[26]), .s(sum[26]), .cout(carry[26]));
FA full_adder12(.x(x0[27]), .y(x1[27]), .cin(x2[27]), .s(sum[27]), .cout(carry[27]));
FA full_adder13(.x(x0[28]), .y(x1[28]), .cin(x2[28]), .s(sum[28]), .cout(carry[28]));
FA full_adder14(.x(x0[29]), .y(x1[29]), .cin(x2[29]), .s(sum[29]), .cout(carry[29]));
FA full_adder15(.x(x0[30]), .y(x1[30]), .cin(x2[30]), .s(sum[30]), .cout(carry[30]));
FA full_adder16(.x(x0[31]), .y(x1[31]), .cin(x2[31]), .s(sum[31]), .cout(carry[31]));

endmodule
