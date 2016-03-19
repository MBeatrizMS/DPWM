`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:52 03/15/2016 
// Design Name: 
// Module Name:    TopModule 
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
module TopModule(

		input wire Selector,
		input wire PushUp,
		input wire PushDown,
		input wire clk,
		input wire reset,
		output wire Modulation,
		
output wire [6:0] Catodos,
output wire [3:0] Anodos


    );

	wire SelectorFU;
	wire SelectorFD;
	wire SelectorCU; 
	wire SelectorCD;
	
	wire [5:0] MaquinaFreqToFreq;
	
	wire SecundarioMaquina;
	
	wire [9:0] CompararCable;
	wire [9:0] Freq;
	
	wire FreceunciaCorriente;
	
	
	
wire [3:0] w1,w2,w3,w4,w5;
wire [1:0] w6;
wire w7;
wire [9:0] Num_Bin;
	
// Instantiate the module
DivisorDeFrecuencia DivisorPrincipal (
    .clk(clk), 
    .reset(reset), 
    .FreqDivValue(MaquinaFreqToFreq), //Nùmero al que tiene que contar 
    .FreqDividida(FreceunciaCorriente) //Valor que va al mòdulo de corriente
    );

// Instantiate the module
MaquinaDivisor2 MaquinaDivisorPrincipal (
    .clk(SecundarioMaquina), 
    .reset(reset), 
    .PushBottonUp(SelectorFU), //Viene del Selector 
    .PushBottonDown(SelectorFD), //Viene del selector
    .FreqDivValue(MaquinaFreqToFreq), //Valor hasta el que va a contar en el mòdulo de frecuencia,lo envìa
    .Freq(Freq)
	 );


// Instantiate the module
MaquinaPWM MaquinaPWM (
    .clk(SecundarioMaquina), 
    .reset(reset), 
    .PushBottonUp(SelectorCU), 
    .PushBottonDown(SelectorCD), 
    .Comparar(CompararCable) // Es el que va a mandar al mòdulo de Corriente, que es el que tiene que comparar
    );


// Instantiate the module
ModuloDivisorDivsor DivisorSecundario (
    .clk(clk), 
    .reset(reset), 
    .FreqDividida(SecundarioMaquina)
    );


// Instantiate the module
PulseWidthModulation PWM (
    .clk(FreceunciaCorriente),  //Frecuencia que viene del divisor
    .reset(reset), 
    .Comparar(CompararCable), // Es el que va a mandar al mòdulo de Corriente, que es el que tiene que comparar
    .Modulation(Modulation) //Salida final
    );
	 
// Instantiate the module
Selector Selec (
    .Selector(Selector), 
    .PushUp(PushUp), 
    .PushDown(PushDown), 
    .PU1(SelectorFU), 
    .PD1(SelectorFD), 
    .PU2(SelectorCU), 
    .PD2(SelectorCD)
    );







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





// Instantiate the module
MuxDisplay MuxDisplay (
    .Selector(Selector), 
    .Frecuencia(Freq), 
    .Corriente(CompararCable), 
    .Salida(Num_Bin)
    );


endmodule
