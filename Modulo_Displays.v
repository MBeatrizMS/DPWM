`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:19:03 03/15/2016 
// Design Name: 
// Module Name:    Modulo_Displays 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision:   
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Modulo_Displays(

input wire [9:0]Num_Bin,
input wire clk,
output wire [6:0]Catodos,
output wire [3:0]Anodos
);

wire [3:0] w1,w2,w3,w4,w5;
wire [1:0] w6;
wire w7;


Divisor_Frecuencia DivisordeFrecuencia (
    .CLK_IN(clk), 
    .CLK_OUT(w7)
    );

	 
Convertidor_Binario_BCD BinariotoBCD ( 
    .N_Binario(Num_Bin), 
    .Millares(w1), 
    .Centenas(w2), 
    .Decenas(w3), 
    .Unidades(w4)
    );
	 
MUX_4a1 MUX_Displays_4a1 (
    .I0(w1), 
    .I1(w2), 
    .I2(w3), 
    .I3(w4), 
    .S(w6), 
    .Y(w5)
    );

Contador_2_bits Contador_Displays (
    .clk(w7), 
    .rst(1'b1), 
    .Count(w6)
	 );
	 
Deco_BinariotoSseg Deco_BCD_7SEG (
    .bin(w5), 
    .sseg(Catodos)
    );

Deco_2_a_4 Decodificadorde2a4(
    .IN(w6), 
    .EN(1'b1), 
    .OUT(Anodos)
    );
	 
endmodule


