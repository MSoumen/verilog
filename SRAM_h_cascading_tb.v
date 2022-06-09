`timescale 10ns/1ns
`include "SRAM_h_cascading.v"

module SRAM_h_cascading_tb;
	reg[7:0] inp;
	reg[2:0] addr;
	reg cs,we;
	wire[7:0] outp;
	
	SRAM_h_cascading uut(inp, addr, we, cs, outp);
	
	integer i;
	initial begin
		$dumpfile("dump.vcd"); $dumpvars(1);
		cs=1;
		//write all
		we=1;
		for(i=0; i<8; i++) begin
			addr = i;
			inp = $random;
			#5;
		end
		//read all
		we=0;
		for(i=0; i<8; i++) begin
			addr = i;
			#5;
		end
	end
endmodule