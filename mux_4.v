`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2020 10:53:43
// Design Name: 
// Module Name: mux_4
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


module mux_4(i,s,f);
    input [3:0] i; input [1:0] s;
    output f;
    wire a,b;
    mux_2 m1(i[0],i[1],s[0],a);
    mux_2 m2(i[2],i[3],s[0],b);
    mux_2 m3(a,b,s[1],f);
endmodule
