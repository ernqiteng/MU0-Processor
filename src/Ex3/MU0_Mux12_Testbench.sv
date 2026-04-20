// COMP12111 Exercise 3 - MU0_Mux12 Testbench
// Version 2024. P W Nutter
//
// Testbench for the 2-to-1 12-bit MUX
// DUT is instantiated for you.
// Need to complete the test stimulus.
//
// Comments:
// tests the design of the 12 bit multiplexer in simulation
// Updated November 2025
// By Ern Qi Teng
//

// Do not touch the following lines as they required for simulation 
`timescale  1ns / 100ps 

module MU0_Mux12_Testbench();

//  Internal signals have been defined for you
//  and must be used for this excercise 
//  DO NOT alter the names of these signals 

logic   [11:0] A, B;
logic          S; 
logic   [11:0] Q; 


// The design has been instantiated for you below:

MU0_Mux12 top(.A(A), .B(B), .S(S), .Q(Q) );


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
	A = 12'hxxx; 
	B = 12'hxxx; 
	// expect Q = 12'hxxx
	
	#100
	S = 0; //Q = A mode
	A = 12'h000; 
	B = 12'hxxx; 
	// expect Q = 12'h000
	
	#100
	A = 12'hxxx; 
	B = 12'h000; 
	// expect Q = 12'hxxx

	#100
	A = 12'h000; 
	B = 12'h000; 
	// expect Q = 12'h000

	#100
	A = 12'hAAA; 
	B = 12'hFFF; 
	// expect Q = 12'hAAA
	
	#100
	A = 12'hFFF; 
	B = 12'hAAA; 
	// expect Q = 12'hFFF
	
	#100
	A = 12'h123; 
	B = 12'h456; 
	// expect Q = 12'h123

	#100
	A = 12'h456; 
	B = 12'h123; 
	// expect Q = 12'h456

	#100
	A = 12'h555; 
	B = 12'h556;
	// expect Q = 12'h555
	
	#100
	S = 1; //Q = B mode
	A = 12'h000; 
	B = 12'hxxx; 
	// expect Q = 12'hxxx
	
	#100
	A = 12'hxxx; 
	B = 12'h000; 
	// expect Q = 12'h000

	#100
	A = 12'h000; 
	B = 12'h000; 
	// expect Q = 12'h000

	#100
	A = 12'hAAA; 
	B = 12'hFFF; 
	// expect Q = 12'hFFF
	
	#100
	A = 12'hFFF; 
	B = 12'hAAA; 
	// expect Q = 12'hAAA
	
	#100
	A = 12'h123; 
	B = 12'h456; 
	// expect Q = 12'h456

	#100
	A = 12'h456; 
	B = 12'h123; 
	// expect Q = 12'h123

	#100
	A = 12'h555; 
	B = 12'h556;
	// expect Q = 12'h556	

// -------------------------------------------------------
// Please make sure your stimulus is above this line

#100 $stop;
end


endmodule
