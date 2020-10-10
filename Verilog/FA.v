
module HA(a, b, sum, carry);

	input a, b;
	output sum, carry;

	assign {carry, sum} = a + b;
	
endmodule



module FA(a, b, cin, sum, carry);

	input a, b, cin;
	output sum, carry;

	assign {carry, sum} = a + b + cin;


endmodule