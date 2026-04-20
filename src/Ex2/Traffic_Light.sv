// Verilog HDL for "COMP12111", "trafficlight" "functional"
//
// COMP12111 - Exercise 2 – Sequential Circuits
//
// Version 2024. P W Nutter
//
// This is the Verilog module for the traffic light junction
//
// The aim of this exercise is complete the finite state machine using the
// state transition diagram given in the laboratory notes. 
//
// DO NOT change the interface to this design or it may not be marked completely
// when submitted.
//
// Make sure you document your code and marks may be awarded/lost for the 
// quality of the comments given.
//
// Add your comments:
// 
// This design implements the Toucan crossing design logic
// Updated October 2025
// By Ern Qi Teng

`timescale  1ns / 100ps 
 
//always blocks partitions design - separates functions
module Traffic_Light ( 	output logic [4:0] lightseq,    // the 5-bit light sequence
                        input  logic       clock,       // clock that drives the fsm
                        input  logic       reset,       // reset signal - single bit
                        input  logic       start);      // input from button - single bit
 
// declare internal variables here
logic [3:0] current_state, next_state; //register holding value of current state and next state
localparam R__G = 5'b01001; //local variables so the outputs are easier to identify and interpret
localparam R_A_ = 5'b01010;
localparam G_R_ = 5'b10100;
localparam RRA_ = 5'b01110;

// implement your next state combinatorial logic block here
//blocking assignments - run in the sequence written
always_comb //determines what the next state will be by using current state and inputs
begin
	//case statement instead of if's make it easier to read
	case (current_state)
		4'b0000: begin
			if (start == 1)
				next_state = 4'b0001;
			else
				next_state = 4'b0000;
			end
		4'b0001: next_state = 4'b0010;
		4'b0010: next_state = 4'b0011;
		4'b0011: next_state = 4'b0100;
		4'b0100: next_state = 4'b0101;
		4'b0101: begin
			if (start == 1)
				next_state = 4'b1000;
			else
				next_state = 4'b0110;
			end
		4'b0110: begin
			if (start == 1)
				next_state = 4'b1001;
			else
				next_state = 4'b0111;
			end
		4'b0111: begin
			if (start == 1)
				next_state = 4'b1010;
			else
				next_state = 4'b0000;
			end
		4'b1000: next_state = 4'b1001;
		4'b1001: next_state = 4'b1010;
		4'b1010: next_state = 4'b0001;
		default: next_state = 4'b0000; //good practice, gives program a defined value
	endcase
end

// implement your current state assignment, register, here, sequential logic
//current state is assigned the value of next state as its input
//reset action - puts system into a known state (initial state - 0)
//non-blocking assignment - allows scheduling of assignments without blocking subsequent statements
//changes on rising edge of the clock or reset
//stores state using flip flops
always_ff @ (posedge clock, posedge reset)
begin
	if (reset == 1)
		current_state <= 4'b0000;
	else
		current_state <= next_state;
end

// implement your output logic here
always_comb 
//determine the state of output signals  from the current state
//changes whenever current state changes value
begin
	case(current_state)
		4'b0000, 4'b0110, 4'b0111, 4'b1000, 4'b1001, 4'b1010: lightseq = R__G;
		4'b0001: lightseq = R_A_;
		4'b0010, 4'b0011, 4'b0100: lightseq = G_R_;
		4'b0101: lightseq = RRA_;
		default: lightseq = 5'b00000;
	endcase
end

endmodule
 
