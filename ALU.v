module ALU(
	input[7:0] a, 
    input[7:0] b,
    input[2:0] operation,
    output[7:0] out,
    output carryOut);
    
    reg[7:0] ALU_reg;
    wire[8:0] tmp;
    
    assign out=ALU_reg;
    assign tmp = a+b;
    assign carryOut = tmp[5];
    always @(*) begin
    	case(operation) // 5 operations to be done
    		3'b000: ALU_reg = a+b; // sum
    		3'b001: ALU_reg = a-b; //subs
    		3'b010: ALU_reg = a^b; //xor
    		3'b011: ALU_reg = a|b; //or
    		3'b100: ALU_reg = a&b; //and
    	endcase
    end
endmodule
