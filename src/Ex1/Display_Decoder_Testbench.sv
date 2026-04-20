// COMP12111 Exercise 1 - Combinatorial Design Testbench
//
// Version 2024. P W Nutter
//
// To do:
// - Declare internal buses and wires
// - Add display decoder instance
// - Produce test stimulus
//
// Make sure you document your code and marks may be awarded/lost for the 
// quality of the comments given. Please document in the header the changes 
// made, when and by whom.
//
// Comments:
// This design implements the testbench for the mutilsegment decoder
// we check each input of input_value produced the required output
// updated September 2025
// By Ern Qi Teng

`timescale  1ns / 100ps 

module Display_Decoder_Testbench;

// declare any internal signals

logic [14:0]  output_value;
logic [3:0]   input_value;

// create instance of Display_Decoder
 
Display_Decoder top(.input_code(input_value),
					.segment_pattern(output_value));


/* Comment block

#VALUE      creates a delay of VALUE ps
a=VALUE;    sets the value of input 'a' to VALUE
$stop;      tells the simulator to stop

*/

// test stimulus

initial
begin
#100  

// Enter you stimulus below this line
// Make sure you test all input combinations with a delay
// -------------------------------------------------------

#100 input_value=4'h0; //test all possible values of a
#100 input_value=4'h1; //four bit value 0-F in hex
#100 input_value=4'h2;
#100 input_value=4'h3;
#100 input_value=4'h4;
#100 input_value=4'h5;
#100 input_value=4'h6;
#100 input_value=4'h7;
#100 input_value=4'h8;
#100 input_value=4'h9;
#100 input_value=4'hA;
#100 input_value=4'hB;
#100 input_value=4'hC;
#100 input_value=4'hD;
#100 input_value=4'hE;
#100 input_value=4'hF;


// -------------------------------------------------------
// Please make sure your stimulus is above this line

#100 $stop;
end


endmodule
 
