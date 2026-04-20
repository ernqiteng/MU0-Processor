// COMP12111 Exercise 3 - MU0_Mux16 Testbench
// Version 2024. P W Nutter
//
// Testbench for the 2-to-1 16-bit MUX
// DUT is instantiated for you.
// Need to complete the test stimulus.
//
// Comments:
// tests the design of the 16 bit multiplexer in simulation
// Updated November 2025
// By Ern Qi Teng
//

// Do not touch the following lines as they required for simulation 
`timescale  1ns / 100ps 

module MU0_Mux16_Testbench();

//  Internal signals have been defined for you
//  and must be used for this excercise 
//  DO NOT alter the names of these signals 

logic   [15:0] A, B;
logic          S; 
logic   [15:0] Q;


// The design has been instantiated for you below:

MU0_Mux16 top(.A(A), .B(B), .S(S), .Q(Q) );


/* Comment block

#VALUE      creates a delay of VALUE ps
a=VALUE;    sets the value of input 'a' to VALUE
$stop;      tells the simulator to stop

*/

initial
begin
// Enter you stimulus below this line
// -------------------------------------------------------
	#100
	
	S = 1'bx; //unknown mode
	A = 16'hxxxx; 
	B = 16'hxxxx; 
	// expect Q = 16'hxxxx
	
	#100
	S = 0; //Q = A mode
	A = 16'h0000; 
	B = 16'hxxxx; 
	// expect Q = 16'h0000
	
	#100
	A = 16'hxxxx; 
	B = 16'h0000; 
	// expect Q = 16'hxxxx

	#100
	A = 16'h0000; 
	B = 16'h0000; 
	// expect Q = 16'h0000

	#100
	A = 16'hAAAA; 
	B = 16'hFFFF; 
	// expect Q = 16'hAAAA
	
	#100
	A = 16'hFFFF; 
	B = 16'hAAAA; 
	// expect Q = 16'hFFFF
	
	#100
	A = 16'h1234; 
	B = 16'h5678; 
	// expect Q = 16'h1234

	#100
	A = 16'h5678; 
	B = 16'h1234; 
	// expect Q = 16'h5678

	#100
	A = 16'h5555; 
	B = 16'h5556;
	// expect Q = 16'h5555
	
	#100
	S = 1; //Q = B mode
	A = 16'h0000; 
	B = 16'hxxxx; 
	// expect Q = 16'hxxxx
	
	#100
	A = 16'hxxxx; 
	B = 16'h0000; 
	// expect Q = 16'h00000

	#100
	A = 16'h0000; 
	B = 16'h0000; 
	// expect Q = 16'h0000

	#100
	A = 16'hAAAA; 
	B = 16'hFFFF; 
	// expect Q = 16'hFFFF
	
	#100
	A = 16'hFFFF; 
	B = 16'hAAAA; 
	// expect Q = 16'hAAAA
	
	#100
	A = 16'h1234; 
	B = 16'h5678; 
	// expect Q = 16'h5678

	#100
	A = 16'h5678; 
	B = 16'h1234; 
	// expect Q = 16'h1234

	#100
	A = 16'h5555; 
	B = 16'h5556;
	// expect Q = 16'h5556

// -------------------------------------------------------
// Please make sure your stimulus is above this line

#100 $stop;
end


endmodule
 
