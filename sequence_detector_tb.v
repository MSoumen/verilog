`timescale 10ns/1ns
`include "sequence_detector.v"

module sequence_detector_tb;
	reg inp_seq, clk, rst;
	wire outp;
	
	sequence_detector uut(
	.inp(inp_seq), .reset(rst), .clock(clk), .outp(outp));
	
	
	
	initial begin
		$dumpfile("dump.vcd"); $dumpvars(1);
		clk=0;
		inp_seq = 0; rst=1; #10;
		rst=0; #10;
		inp_seq = 1; #10;
		inp_seq = 1; #10;
		inp_seq = 0; #10;
		inp_seq = 0; #10;
		inp_seq = 0; #10;
		$finish; // for exiting the program
	end
	
	always #2 clk=~clk; 
	
	
endmodule
