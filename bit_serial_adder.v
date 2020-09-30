/* Assignment : 2
   Problem No : 3
   Semester : Autumn 2020
   Group No : G10
   Members : Ayudh Saxena & Anmol Harsh */

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2020 15:40:10
// Design Name: 
// Module Name: bit_serial_adder
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

// Takes 3 input bits a,b,cin and produces the corresponding carry and sum
// a simple full adder
module full_adder(a,b,cin,sum,cout);
    input a,b,cin;
    output sum,cout;
    wire w1,w2,w3;
    xor sum_bit(sum,a,b,cin);   //calculating the sum bit
    and m1(w1,a,b);
    and m2(w2,a,cin);
    and m3(w3,cin,b);
    or m4(cout,w1,w2,w3);    // If atleast any two of a,b,cin bits are set then carry bit is set, cout is calculated
endmodule


//implementing a d-flipflop for register
module d_flip_flop(clk,d,q,clr);

input clk,d,clr;
output reg q;

always @(posedge clk)
begin
    if(clr == 1)
        q <= 0;
    else
        q <= d;
end

endmodule


//implementing shift register using the above designed d-flipflop 
module shift_register_8bit(clk,a,write,clr,out);

input [7:0] a;
input write,clr,clk;
output out;
wire [7:0] wo,wi;

//load the data directly into the flip-flops when write = 0
assign wi[7] = write ? a[7] : a[7];
assign wi[6] = write ? a[6] : wo[7];
assign wi[5] = write ? a[5] : wo[6];   
assign wi[4] = write ? a[4] : wo[5];   
assign wi[3] = write ? a[3] : wo[4];   
assign wi[2] = write ? a[2] : wo[3];   
assign wi[1] = write ? a[1] : wo[2];
assign wi[0] = write ? a[0] : wo[1];
   
    
d_flip_flop d1(.clk(clk), .d(wi[7]),.q(wo[7]),.clr(clr));
d_flip_flop d2(.clk(clk), .d(wi[6]),.q(wo[6]),.clr(clr));
d_flip_flop d3(.clk(clk), .d(wi[5]),.q(wo[5]),.clr(clr));
d_flip_flop d4(.clk(clk), .d(wi[4]),.q(wo[4]),.clr(clr));
d_flip_flop d5(.clk(clk), .d(wi[3]),.q(wo[3]),.clr(clr));
d_flip_flop d6(.clk(clk), .d(wi[2]),.q(wo[2]),.clr(clr));
d_flip_flop d7(.clk(clk), .d(wi[1]),.q(wo[1]),.clr(clr));
d_flip_flop d8(.clk(clk), .d(wi[0]),.q(wo[0]),.clr(clr));

assign out = wo[0];


endmodule


module bit_serial_adder(
    a,b,clk,sum,clr,write,cout
    );
input [7:0] a,b;
input clk,clr,write;
output reg[7:0] sum;
output wire cout;
reg stop;
integer count = 0;
wire out1,out2,win,wout,sumbit;
assign cout = wout;
integer i;

shift_register_8bit m1(.clk(clk),.a(a[7:0]),.clr(clr),.write(write),.out(out1));    //shifting memory of a
shift_register_8bit m2(.clk(clk),.a(b[7:0]),.clr(clr),.write(write),.out(out2));    //shifting memory of b
full_adder f1(.a(out1),.b(out2),.cin(win),.cout(wout),.sum(sumbit));                // to perform bit addition
d_flip_flop d1(.clk(clk),.q(win),.d(wout),.clr(clr));                               // to store the carry

/*keep count = 0 whenever write = 1 since we begin the process of addition 
as soon as write becomes 0 and hence begin incrementing count */

always @(write)begin                         
    count = 0;
end

//checking clear, or assigning the sumbit calculated so far
always @(posedge clk)
begin
    if(clr == 1)begin //clear everything when clr = 1
        sum <= 0;
        count <= 0;
    end
    else if(count < 8) begin 
        sum[count] <= sumbit;       //storing the next sumbit
        count <= count + 1;         //shifting the index
    end
end

endmodule
