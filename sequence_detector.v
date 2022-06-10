module sequence_detector(
	input inp, reset, clock,
	output reg outp);

parameter 
	ZERO = 4'b0000,
	ONE = 4'b0001,
	ONEzero = 4'b0010,
	ONEzeroONE = 4'b0101,
	ONEzeroONEone = 4'b1011;
	
	reg[3:0] current_state, next_state;
	
	always @(posedge clock, posedge reset) begin
		if(reset==1) current_state<= ZERO;
		else current_state<=next_state;
	end
	
	always @(current_state, inp) begin
		case(current_state)
			ZERO: begin
					if(inp==1) next_state = ONE;
					else next_state = ZERO;
				end
			ONE: begin
					if(inp==0) next_state = ONEzeroONE;
					else next_state = ONE;
				end
			ONEzero: begin
					if(inp==0) next_state = ZERO;
					else next_state = ONEzeroONE;
				end
			ONEzeroONE: begin
					if(inp==0) next_state = ONEzero;
					else next_state = ONEzeroONEone;
				end
			ONEzeroONEone: begin
					if(inp==0) next_state = ONEzero;
					else next_state = ONE;
				end
			default: next_state = ZERO;
		endcase
	end
	
	always @(current_state) begin
		case(current_state)
			ZERO: outp<=0;
			ONE : outp<=1;
			ONEzero: outp<=0;
			ONEzeroONE: outp<=0;
			ONEzeroONEone: outp<=1;
		endcase
	end

endmodule
		
		
		
		
		
		
