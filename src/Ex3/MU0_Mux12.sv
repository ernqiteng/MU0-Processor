// COMP12111 Exercise 3 - MU0_Mux12 
// Version 2024. P W Nutter
// 
// 2-to-1 12-bit MUX implementation
//
// Implement using behavioural Verilog
//
// Comments:
// creates 12 bit multiplexer to be used in the datapath of the MU0 processor
// Updated November 2025
// By Ern Qi Teng
//

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps
 

// module definition - multiplexers select one of the several input signals and forwards it to a single output line

module MU0_Mux12 (
input  logic [11:0] A, //input A
input  logic [11:0] B, //input B
input  logic        S, //determines which input should be output
output logic [11:0] Q); //output


// Combinatorial logic for 2to1 multiplexor
// S is select, A channel0, B channel1

always_comb
begin
	case(S)
		0: Q = A;
		1: Q = B;
		default: Q = 12'hxxx;
	endcase
end
endmodule 
 
