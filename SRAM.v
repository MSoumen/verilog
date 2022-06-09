/*
* SRAM of 8x4bit=32bit 
* address will be 3bit(0-7)
* data input/output should be 4bit(we can store 0-15 in one word)
* size of total RAM will be RAM[wordLength][total blocks]
*/
module SRAM(
	input[3:0] dataIn, //4bit data
	input[2:0] address, //3bit addr
	input chipSelect, writeEnable,
	output[3:0] dataOut
);
//taking a ram as 2d array
	reg[3:0] ram[7:0];
	reg[3:0] tmp;
	
	always @(*) begin
		if(chipSelect) if(writeEnable) begin
				ram[address] <= dataIn;
				tmp<=4'bxxxx;
			end
			else tmp<=ram[address];
		else tmp<=4'bxxxx;
	end
	assign dataOut=tmp;
endmodule