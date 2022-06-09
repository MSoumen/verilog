`timescale 1ms/1ns
`include "andGate.v"

module andGate_tb();

	reg inp1,inp2;
	wire out;
	
	andGate uut(.a(inp1), .b(inp2), .c(out));
	
	initial begin
		$dumpfile("dump.vcd"); $dumpvars(1);
		inp1='b0; inp2='b0;
		#10; inp1='b0; inp2='b1;
		#10; inp1='b1; inp2='b0;
		#10; inp1='b1; inp2='b1;
		#10;
	end
endmodule