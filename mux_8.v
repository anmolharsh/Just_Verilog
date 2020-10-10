`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2020 10:53:43
// Design Name: 
// Module Name: mux_8
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


module mux_8(i,s,f);
    input [7:0] i;input [2:0] s;
    output f;
    wire a,b;
    mux_4 m1({i[3:0]},{s[1:0]},a);
    mux_4 m2({i[7:4]},{s[1:0]},b);
    mux_2 m3(a,b,s[2],f);
endmodule
