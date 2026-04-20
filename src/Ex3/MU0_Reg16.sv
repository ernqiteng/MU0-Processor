// COMP12111 Exercise 3 - MU0_Reg16 
// Version 2024. P W Nutter
// 
// 16-bit Register implementation
//
// Implement using behavioural Verilog
//
// Comments:
// creates a 16 bit register (fast-access memory location) to be used in the datapath of the MU0 processor
// Updated November 2025
// By Ern Qi Teng
//

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps
 

// module definition

module MU0_Reg16 (
input  logic         Clk, 
input  logic         Reset,     
input  logic         En, //clock enable signal
input  logic  [15:0] D, //16 bit data input
output logic  [15:0] Q
 );

// behavioural code - clock driven
always_ff @ (posedge Clk, posedge Reset) //register is only updated on the rising edge of the clock or reset
							//otherwise stored value remains unchanged
begin
	if (Reset) //reset signal acts asynchronously 
		Q <= 12'h000; //when reset is high, stored value in the register is cleared to 0
	else if (En)
		Q <= D; //only changes to data value if it is on the rising edge of the clock and clock enable is high
end

endmodule  
