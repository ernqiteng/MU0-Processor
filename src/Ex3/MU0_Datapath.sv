// COMP12111 Exercise 3 - MU0_Datapath 
// Version 2024. P W Nutter
//
// MU0 datapath design - structural Verilog
// Design is incomplete - functional components of the
// MU0 datapath need instantiation.
// Use the names used in the lab instructions.
//
// Comments:
// instantiates all the components in the datapath
// Updated November 2025
// By Ern Qi Teng
//

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps
 

module MU0_Datapath(
input  logic        Clk, //external clock input to the processor, sequences instruction execution
input  logic        Reset, //places processor to a predefined initial state
input  logic [15:0] Din, //data in, 16 bit input bus from memory, data from memory at the address specified on the address bus is read into the processor
input  logic        X_sel, //wires
input  logic        Y_sel,
input  logic        Addr_sel,
input  logic        PC_En,  //enable signals 
input  logic        IR_En,
input  logic        Acc_En, 
input  logic [1:0]  M,
output logic [3:0]  F,			// top 4 bits of the instruction
output logic [11:0] Address, //12 bit output bus to memory, addresses for read/write memory is places
output logic [15:0] Dout, //data output, 16 bit output bus to memory, any data to be written to memory using address on the address bus
output logic        N, //negative flag
output logic        Z, //zero flag
output logic [11:0] PC,
output logic [15:0] Acc); //accumulator

//Rd - output that is asserted when a memory read operation is performed, results in data being read into the processor on the Din bus from the address in memory
//Wr - output that is asserted when a memory write operation is performed, results in data on the Dout bus being written to memory
//Halted - output indicating the processor has halted due to the execution of a particular instruction

// Define internal signals using names from the datapath schematic
logic [15:0] X;
logic [15:0] IR;

logic [15:0] Y;
logic [15:0] ALU;

// Instantiate Datapath components

//MU0 registers

MU0_Reg12 PCReg(.D(ALU[11:0]), .Clk(Clk), .Reset(Reset), .En(PC_En), .Q(PC) );
MU0_Reg16 ACCReg(.D(ALU), .Clk(Clk), .Reset(Reset), .En(Acc_En), .Q(Acc) );
MU0_Reg16 IRReg(.D(Din), .Clk(Clk), .Reset(Reset), .En(IR_En), .Q(IR) );

// MU0 multiplexors
MU0_Mux12 AddrMux(.A(PC), .B(IR[11:0]), .S(Addr_sel), .Q(Address) );
MU0_Mux16 XMux(.A(Acc), .B({4'b0000, PC[11:0]}), .S(X_sel), .Q(X) );
MU0_Mux16 YMux(.A(Din), .B(IR), .S(Y_sel), .Q(Y) );

// MU0 ALU
MU0_Alu MU0_ALU(.X(X), .Y(Y), .M(M), .Q(ALU));

// MU0 Flag generation
//flags are used to control the conditional branches (JGE, JNE)
MU0_Flags FLAGS(.Acc(Acc), .N(N), .Z(Z));

// The following connects X and Dout together, there's no need for you to do so
// use X when defining your datapath structure
assign Dout = X;
// Buffer added F is op 4 bits of the instruction
assign F = IR[15:12];

endmodule 
 
