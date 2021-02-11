`include "defines.vh"
module adder(
        output  [7: 0]  S,
        input   [3: 0]  A,
        input   [3: 0]  B,
		  output Cout
    );
	
	// TODO: Implement a carry look-ahead adder
	 wire [3:0] p;
	 wire [3:0] g;
	 wire [3:0] c;
	 wire [3:0] c_o;
	 assign  p = A | B;
				
	 assign  g = A & B;
				
	 assign  c[0] = 0,
				c[1] = g[0] | p[0] & c[0],
				c[2] = g[1] | p[1] & (g[0] | p[0] & c[0]),
				c[3] = g[2] | p[2] & (g[1] | p[1] & (g[0] | p[0] & c[0]));
	 full_adder add1(S[0], c_o[0], A[0], B[0], c[0]);
	 full_adder add2(S[1], c_o[1], A[1], B[1], c[1]);
	 full_adder add3(S[2], c_o[2], A[2], B[2], c[2]);
	 full_adder add4(S[3], Cout, A[3], B[3], c[3]);
	 assign S[7:4] = 4'b0;

endmodule
