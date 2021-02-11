`include "instruction.vh"
`include "alu_opsel.vh"

module decoder(
	output	reg	[31:0]	op1,
	output	reg	[31:0]	op2,
	output	reg	[2:0]		opsel,
	input				[31:0]	instruction
	);

	always @(*) begin
		case (instruction[31:16])
			/*
			 * TODO 1: Decode the instruction and set the outputs. Follow the
			 * example given.
			 * Note: See the instruction definitions in instruction.vh.
			 * Note: You don't need to worry about registers here, just about the
			 * values of op1, op2 and opsel. The register selection logic is in
			 * the cpu module (see the alu_A and alu_B signals).
			 */
			`INSTRUCTION_NOP: begin
				op1	= 32'bx;
				op2	= 32'bx;
				opsel	= `OPSEL_NONE;
			end
			
			`INSTRUCTION_AND: begin
				op1[7:0] = instruction[15:8]; 
				op2[7:0] = instruction[7:0];
				opsel	= `OPSEL_AND;
			end
			
			`INSTRUCTION_OR: begin
				op1[7:0] = instruction[15:8]; 
				op2[7:0] = instruction[7:0];
				opsel	= `OPSEL_OR;
			end
			
			`INSTRUCTION_XOR: begin
				op1[7:0] = instruction[15:8]; 
				op2[7:0] = instruction[7:0];
				opsel	= `OPSEL_XOR;
			end

			`INSTRUCTION_NEG: begin
				op1[7:0] = instruction[15:8]; 
				op2 = 32'bx;
				opsel	= `OPSEL_NEG;
			end

			`INSTRUCTION_ADD: begin
				op1[7:0] = instruction[15:8]; 
				op2[7:0] = instruction[7:0];
				opsel	= `OPSEL_ADD;
			end

			`INSTRUCTION_SUB: begin
				op1[7:0] = instruction[15:8]; 
				op2[7:0] = instruction[7:0];
				opsel	= `OPSEL_SUB;
			end
			
		endcase
	end

endmodule
