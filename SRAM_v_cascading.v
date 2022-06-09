`include "SRAM.v"
/*
* here we vertically cascade 2 8x4 SRAM
* so, number of blocks will be doubled(8 -> 16)
* thus no. of address bus will increase (4bit address)
*/
module SRAM_v_cascading(
	input[3:0] dataInp,
	input[3:0] address,
	input chipSelect, writeEnable,
	output[3:0] dataOutp);
	
	wire[3:0] V[1:0];
	
	SRAM ram0(dataInp, address[2:0], ~address[3],
	we, V[0]);
	SRAM ram1(dataInp, address[2:0], address[3],
	we, V[1]);
	
	//$display("V[0]=%b  V[1]=%b\n",V[0], V[1]);
	assign dataOutp = address[3]?V[0]:V[1] ;
endmodule