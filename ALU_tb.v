`timescale 10ns/1ns
`include "ALU.v"

module ALU_tb;
	reg[7:0] data1, data2;
	reg[2:0] opcode;
	wire[7:0] outp;
	wire cout;
	integer i;
	
	ALU uut(.a(data1), .b(data2), 
		.operation(opcode), .out(outp),
		.carryOut(cout));
	
	initial begin
		$dumpfile("dump.vcd"); $dumpvars(1);
		data1 = 8'b00001000; data2 = 8'b00010000;
		opcode = 3'b000; #5;
		for(i=0; i<=4; i++) begin
			opcode = opcode + 8'b1;
			#5;
		end
	end
endmodule
