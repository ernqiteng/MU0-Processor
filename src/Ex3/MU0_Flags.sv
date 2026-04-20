// COMP12111 Exercise 3 - MU0_Flags 
// Version 2024. P W Nutter
// 
// Provides the functionality of the flag generator in
// the MU0 datapath
//

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps
 

// module definition

module MU0_Flags (
input  logic [15:0]  Acc, 
output logic          N, //negative and zero flag
output logic          Z
);

// Combinatorial logic

always @(*)
 begin
   Z = ~|Acc;     // When Acc equals 0, Zero flag is set
   N = Acc[15];   // When negative bit of Acc is set, Negative flag is set
 end

endmodule 
 
