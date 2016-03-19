`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:01:45 03/15/2016 
// Design Name: 
// Module Name:    ModuloDivisorDivsor 
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

module ModuloDivisorDivsor(
   input wire clk,         //Se�al de entrada, referente a comportamiento de reloj.
	input wire reset,       //Reset de se�al.
	output reg FreqDividida = 1'b0 //Se�al de salida del divisor, se�al ya dividida que ira a las respectivas m�quinas.
	
    );
	 
reg [22:0] cuenta = 23'b0; /*Bus de datos de 23 bits referente al contador
							para una unidad decimal maxima de 6250000 (2^23 = 8388608) suficiente para la cuenta de 6250000
							que es el valor para que se pueda visualizar el cambio de bot�n*/
 
always @(posedge clk,posedge reset) //Se procede a realizar el codigo posterior siempre que "clk" o "reset" est�n en alto.
	begin
		if (reset) //Si "reset" est� en alto, se pone la salida "s_clk" en 0 y se resetea la cuenta.
			begin
				FreqDividida <= 0;
				cuenta <= 0;
			end 
		else //Se est� en alto la se�al de "clk" pero no la de "reset" se procede a realizar lo siguiente.
			begin		
				if (cuenta == 23'd6250000)//(el 625 sale de: (relojNexys:100M/((FrecuenciaQueQuiero: para un periodo de 125ms)*2)))), Si el contador llega a la cuenta 6250000:   
					begin                    
						cuenta <= 7'h0;  //Se resetea la cuenta poniendola en cero   
						FreqDividida <= ~FreqDividida;  //
					end 
				else 
					cuenta <= cuenta + 1'b1; //De no ser el valor a dividir, el contador seguir� contando (valga la redundancia)
			end
	end
 
endmodule
