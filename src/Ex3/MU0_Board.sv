// COMP12111 Exercise 3 - MU0_Board 
// Version 2024. P W Nutter
//
// Provides the funcitonality required to interface
// to the peripherals on the 1st year experimental board
//

`timescale 1ns / 100ps 
 

module MU0_Board (
// FPGA external connections - do not edit
output logic  Buzzer_pin,
output logic  dac_cs_pin,
output logic  dac_load_pin,
output logic  dac_pd_pin,
output logic  dac_we_pin,
output logic [10:0]  Traffic_lights_pin,
output logic [14:0]  Segments_pin,
output logic [5:0]   Columns_pin,
output logic [3:0]   keyrow_pin,
output logic [11:0]  dac_data_pin,
output logic [1:0]   S7_leds_pin,
inout logic [3:0]  ftdi,
input logic Clk,
input logic Reset,
input logic [3:0]  Simple_buttons_pin,
input logic [5:0]  keycol_pin
 );


// Buses in the design
logic  [14:0]  digit5;
logic  [15:0]  breakpoint_adr;
logic  [15:0]  mem_din;
logic  [14:0]  Display_Digit1;
logic  [14:0]  Display_Digit0;
logic  [11:0]  dac_data;
logic  [15:0]  mem_dout;
logic  [14:0]  digit1;
logic  [23:0]  buttons;
logic  [15:0]  proc_din;
logic  [14:0]  Display_Digit2;
logic  [15:0]  mu0_dout;
logic  [14:0]  digit3;
logic  [10:0]  traffic_lights;
logic  [11:0]  mem_addr;
logic  [14:0]  digit2;
logic  [14:0]  digit0;
logic  [3:0]  Simple_buttons;
logic  [14:0]  Display_Digit3;
logic  [14:0]  Display_Digit5;
logic  [1:0]  s7_leds;
logic  [14:0]  digit4;
logic  [15:0]  mu0_din;
logic  [14:0]  Display_Digit4;
logic  [3:0]  proc_cc;
logic  [11:0]  proc_addr;
logic NC1;
logic Clk_1Hz, Clk_1kHz, Clk_25MHz, Clk_100MHz;
logic dac_we;
logic bp_mem_write_en;
logic bp_mem_data_write;
logic bp_detected;
logic bp_mem_data_read;
logic mem_wen;
logic proc_clk;
logic proc_reset;
logic proc_fetch;
logic proc_halted;
logic buzzer_pulses;
logic writeEn0;

BoardV3 Board1 ( .Crossing_B(traffic_lights[10:5]),
     .Crossing_A(traffic_lights[4:0]), .Clk_1Hz(Clk_1Hz),
     .Clk_25MHz(Clk_25MHz), .dac_we(dac_we), .dac_data(dac_data[11:0]),
     .dac_we_pin(dac_we_pin), .dac_cs_pin(dac_cs_pin),
     .dac_load_pin(dac_load_pin), .dac_pd_pin(dac_pd_pin),
     .Columns_pin(Columns_pin[5:0]), .Segments_pin(Segments_pin[14:0]),
     .Simple_buttons(Simple_buttons[3:0]), .ftdi(ftdi[3:0]),
     .S7_leds(s7_leds[1:0]),
     .Simple_buttons_pin(Simple_buttons_pin[3:0]),
     .Buzzer_pin(Buzzer_pin), .Digit0(Display_Digit0[14:0]),
     .Digit1(Display_Digit1[14:0]), .Digit2(Display_Digit2[14:0]),
     .Digit3(Display_Digit3[14:0]), .Digit4(Display_Digit4[14:0]),
     .Digit5(Display_Digit5[14:0]), .Reset(Reset),
     .S7_leds_pin(S7_leds_pin[1:0]), .Clk_100MHz(Clk_100MHz),
     .Clk(Clk), .keycol_pin(keycol_pin[5:0]),
     .dac_data_pin(dac_data_pin[11:0]), .button(buttons[23:0]),
     .keyrow_pin(keyrow_pin[3:0]),
     .Traffic_lights_pin(Traffic_lights_pin[10:0]),
     .bp_mem_write_en(bp_mem_write_en),
     .bp_mem_data_write(bp_mem_data_write),
     .breakpoint_adr(breakpoint_adr[15:0]), .bp_detected(bp_detected),
     .bp_mem_data_read(bp_mem_data_read), .proc_cc(proc_cc[3:0]),
     .mem_addr(mem_addr[11:0]), .mem_dout(mem_dout[15:0]),
     .mem_wen(mem_wen), .proc_clk(proc_clk), .proc_reset(proc_reset),
     .mem_din(mem_din[15:0]), .proc_din(proc_din[15:0]),
     .proc_fetch(proc_fetch), .proc_halted(proc_halted),
     .Buzzer(buzzer_pulses), .Clk_1kHz(Clk_1kHz));
     
MU0 MU01 ( .srcC(mem_addr[1:0]), .regC(proc_din[15:0]),
     .Addr(proc_addr[11:0]), .Clk(proc_clk), .Din(mu0_din[15:0]),
     .Dout(mu0_dout[15:0]), .Halted(proc_halted), .cc(proc_cc[1:0]),
     .Rd(NC1), .Reset(proc_reset), .Wr(writeEn0),
     .fetch(proc_fetch));

MU0_Memory MEM1 ( .keypad(buttons[15:0]),
     .Simple_buttons(Simple_buttons[3:0]),
     .buttons_AtoH(buttons[23:16]), .s7_leds(s7_leds[1:0]),
     .traffic_lights(traffic_lights[10:0]),
     .breakpoint_mem_adr(breakpoint_adr[15:0]),
     .buzzer_pulses(buzzer_pulses), .digit0(digit0),
     .digit1(digit1), .digit2(digit2), .digit3(digit3),
     .digit4(digit4), .digit5(digit5),
     .WEnAckie_bp(bp_mem_write_en), .bp_mem_detected(bp_detected),
     .bp_mem_data_ackie_read(bp_mem_data_read),
     .bp_mem_data_ackie_write(bp_mem_data_write), .Clk(Clk_25MHz),
     .write_data1(mem_dout[15:0]), .write_data0(mu0_dout[15:0]),
     .address1(mem_addr[11:0]), .address0(proc_addr[11:0]),
     .WEn1(mem_wen), .WEn0(writeEn0), .read_data1(mem_din[15:0]),
     .read_data0(mu0_din[15:0]));
     
assign Display_Digit0[14:0] = digit0;
assign Display_Digit1[14:0]= digit1;
assign Display_Digit2[14:0]= digit2;
assign Display_Digit3[14:0]= digit3;
assign Display_Digit4[14:0]= digit4;
assign Display_Digit5[14:0]= digit5;

assign proc_cc[3:2] = 2'b00;
assign dac_data = 12'b0000_0000_0000;
assign dac_we = 1'b1; // Disable D2A

endmodule

