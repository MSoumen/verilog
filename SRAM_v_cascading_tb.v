`timescale 10ns/1ns
`include "SRAM_v_cascading.v"

module SRAM_v_cascading_tb;
	reg[3:0] inp;
	reg[3:0] addr;
	reg cs,we;
	wire[3:0] outp;
	
	SRAM_v_cascading uut(inp, addr, cs, we, outp);
	
	integer i;
	initial begin
		$dumpfile("dump.vcd"); $dumpvars(1);
		cs=1;
		//write all
		we=1;
		for(i=0; i<16; i++) begin
			addr = i;
			inp = $random;
			#2;
		end
		//read all
		we=0;
		for(i=0; i<16; i++) begin
			addr = i;
			#2;
		end
	end
endmodule