`timescale 10ns/1ns
`include "SRAM.v"

module SRAM_tb;

	reg[3:0] inp;
	reg[2:0] addr;
	reg cs, we;
	wire[3:0] outp;
	
	SRAM uut(.dataIn(inp), .address(addr), .chipSelect(cs),
	.writeEnable(we), .dataOut(outp));
	integer i;
	initial begin
		$dumpfile("dump.vcd"); $dumpvars(1);
		cs=1;
		//write
		we=1;
		for(i=0; i<8; i++) begin
			addr=i;
			inp=$random;
			#5;
		end
		//read
		we=0; addr=3'b111; #2;
		we=0; addr=3'b110; #2;
		we=0; addr=3'b101; #2;
		we=0; addr=3'b100; #2;
		we=0; addr=3'b011; #2;
		we=0; addr=3'b010; #2;
		we=0; addr=3'b001; #2;
		we=0; addr=3'b000; #2;
		//write-read
		we=1; addr=3'b111; inp=4'b0111; #5;
		we=0; addr=3'b111;#5;
		we=1; addr=3'b100; inp=4'b0100; #5;
		we=0; addr=3'b100;#5;
		we=1; addr=3'b101; inp=4'b0111; #5;
		we=0; addr=3'b101;#5;
	end
endmodule