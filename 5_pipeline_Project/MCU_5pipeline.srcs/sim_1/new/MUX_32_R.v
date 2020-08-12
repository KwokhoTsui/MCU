`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/27 15:15:37
// Design Name: 
// Module Name: MUX_32_R
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MUX_32_R(
s,
result,
ctrl
   );
input [31:0]s;
input [4:0]ctrl;
output result;
 
wire a0= ~ctrl[4] & ~ctrl[3] & ~ctrl[2] & ~ctrl[1] & ~ctrl[0];//控制信号用来选择
wire a1= ~ctrl[4] & ~ctrl[3] & ~ctrl[2] & ~ctrl[1] & ctrl[0];
wire a2= ~ctrl[4] & ~ctrl[3] & ~ctrl[2] & ctrl[1] & ~ctrl[0];
wire a3= ~ctrl[4] & ~ctrl[3] & ~ctrl[2] & ctrl[1] & ctrl[0];
wire a4= ~ctrl[4] & ~ctrl[3] & ctrl[2] & ~ctrl[1] & ~ctrl[0];
wire a5= ~ctrl[4] & ~ctrl[3] & ctrl[2] & ~ctrl[1] & ctrl[0];
wire a6= ~ctrl[4] & ~ctrl[3] & ctrl[2] & ctrl[1] & ~ctrl[0];
wire a7= ~ctrl[4] & ~ctrl[3] & ctrl[2] & ctrl[1] & ctrl[0];
wire a8= ~ctrl[4] & ctrl[3] & ~ctrl[2] & ~ctrl[1] & ~ctrl[0]; 
wire a9= ~ctrl[4] & ctrl[3] & ~ctrl[2] & ~ctrl[1] & ctrl[0];
wire a10= ~ctrl[4] & ctrl[3] & ~ctrl[2] & ctrl[1] & ~ctrl[0];
wire a11= ~ctrl[4] & ctrl[3] & ~ctrl[2] & ctrl[1] & ctrl[0];
wire a12= ~ctrl[4] & ctrl[3] & ctrl[2] & ~ctrl[1] & ~ctrl[0];
wire a13= ~ctrl[4] & ctrl[3] & ctrl[2] & ~ctrl[1] & ctrl[0];
wire a14= ~ctrl[4] & ctrl[3] & ctrl[2] & ctrl[1] & ~ctrl[0]; 
wire a15= ~ctrl[4] & ctrl[3] & ctrl[2] & ctrl[1] & ctrl[0];
wire a16= ctrl[4] & ~ctrl[3] & ~ctrl[2] & ~ctrl[1] & ~ctrl[0];
wire a17= ctrl[4] & ~ctrl[3] & ~ctrl[2] & ~ctrl[1] & ctrl[0];
wire a18= ctrl[4] & ~ctrl[3] & ~ctrl[2] & ctrl[1] & ~ctrl[0];
wire a19= ctrl[4] & ~ctrl[3] & ~ctrl[2] & ctrl[1] & ctrl[0];
wire a20= ctrl[4] & ~ctrl[3] & ctrl[2] & ~ctrl[1] & ~ctrl[0];
wire a21= ctrl[4] & ~ctrl[3] & ctrl[2] & ~ctrl[1] & ctrl[0];
wire a22= ctrl[4] & ~ctrl[3] & ctrl[2] & ctrl[1] & ~ctrl[0];
wire a23= ctrl[4] & ~ctrl[3] & ctrl[2] & ctrl[1] & ctrl[0];
wire a24= ctrl[4] & ctrl[3] & ~ctrl[2] & ~ctrl[1] & ~ctrl[0];
wire a25= ctrl[4] & ctrl[3] & ~ctrl[2] & ~ctrl[1] & ctrl[0];
wire a26= ctrl[4] & ctrl[3] & ~ctrl[2] & ctrl[1] & ~ctrl[0];
wire a27= ctrl[4] & ctrl[3] & ~ctrl[2] & ctrl[1] & ctrl[0];
wire a28= ctrl[4] & ctrl[3] & ctrl[2] & ~ctrl[1] & ~ctrl[0];
wire a29= ctrl[4] & ctrl[3] & ctrl[2] & ~ctrl[1] & ctrl[0];
wire a30= ctrl[4] & ctrl[3] & ctrl[2] & ctrl[1] & ~ctrl[0];
wire a31= ctrl[4] & ctrl[3] & ctrl[2] & ctrl[1] & ctrl[0];

assign result=(a0&s[0])|(a1&s[1])|(a2&s[2])|(a3&s[3])|(a4&s[4])|(a5&s[5])|(a6&s[6])|(a7&s[7])|(a8&s[8])|(a9&s[9])|(a10&s[10])|(a11&s[11])|(a12&s[12])|(a13&s[13])|(a14&s[14])|(a15&s[15])|(a16&s[16])|(a17&s[17])|(a18&s[18])|(a19&s[19])|(a20&s[20])|(a21&s[21])|(a22&s[22])|(a23&s[23])|(a24&s[24])|(a25&s[25])|(a26&s[26])|(a27&s[27])|(a28&s[28])|(a29&s[29])|(a30&s[30])|(a31&s[31]);//右移
endmodule

