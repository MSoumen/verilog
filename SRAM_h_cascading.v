`include "SRAM.v"
/*
* we cascade 2 SRAM horizontally
* the total capacity will be doubled
* number of blocks will be same
*/
module SRAM_h_cascading(
	input[7:0] dataInp,
	input[2:0] address,
	input writeEnable, chipSelect,
	output[7:0] dataOutp);

	SRAM ram0(.dataIn(dataInp[3:0]), .address(address),
	.writeEnable(writeEnable), .chipSelect(chipSelect), .dataOut(dataOutp[3:0]));
	
	SRAM ram1(dataInp[7:4], address, 
	chipSelect, writeEnable, dataOutp[7:4]);
	
endmodule