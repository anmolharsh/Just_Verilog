`timescale 1ns / 1ps


module unsigned_array_mult(
input [5:0]a,
input [5:0]b,
output reg[11:0] product
    );
    integer i;
    integer j;
    integer index;
    reg temp,p,q;
    
    always @(*) begin
    product=0;
    for(i=0;i<=5;i=i+1)
    begin
    q=0;
    for(j=0;j<=5;j=j+1)
    begin 
    temp=a[i]&b[j];
    index=(i+j);
    {q,p}= product[index]+ temp + q;
    product[index]=p;
    end
    index=i+j;
    product[index]=q;
    end
    end   
endmodule
