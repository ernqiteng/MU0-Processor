// COMP12111 Exercise 3 - MU0_Alu 
// Version 2024. P W Nutter
//
// MU0 ALU design 
//
// Comments:
// defines arithmetic operations used in the datapath of the MU0 processor
// Updated November 2025
// By Ern Qi Teng
//

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps 

// module header - performs arithmetic in the processor

module MU0_Alu (
               input  logic  [15:0]  X, //operand X, 16 bit input
               input  logic  [15:0]  Y, //operand Y, 16 bit input
               input  logic  [1:0]   M, //2 bit control signal, identifies operation required from the ALU
               output logic  [15:0]  Q //16 bit result produced by operation defined by M on the inputs X and Y
	       );

// behavioural description for the ALU

always_comb //re-evaluated when any of the inputs changes
begin
	case(M)
		2'b00: Q = Y;
		2'b01: Q = X + Y;
		2'b10: Q = X + 16'b0000000000000001;
		2'b11: Q = X + (~Y + 16'b0000000000000001); //changed to not use Verilog subtraction operand as it is a bad design choice
					//suitable for 2's complement arithmetic
		default: Q = 16'hxxxx; //no signal
	endcase
end

endmodule 
