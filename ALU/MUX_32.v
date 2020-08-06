`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/27 12:39:25
// Design Name: 
// Module Name: MUX_32
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


module MUX_32(
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

assign result=(a0&s[31])|(a1&s[30])|(a2&s[29])|(a3&s[28])|(a4&s[27])|(a5&s[26])|(a6&s[25])|(a7&s[24])|(a8&s[23])|(a9&s[22])|(a10&s[21])|(a11&s[20])|(a12&s[19])|(a13&s[18])|(a14&s[17])|(a15&s[16])|(a16&s[15])|(a17&s[14])|(a18&s[13])|(a19&s[12])|(a20&s[11])|(a21&s[10])|(a22&s[9])|(a23&s[8])|(a24&s[7])|(a25&s[6])|(a26&s[5])|(a27&s[4])|(a28&s[3])|(a29&s[2])|(a30&s[1])|(a31&s[0]);//左移
endmodule
