`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:25:11 02/28/2016 
// Design Name: 
// Module Name:    DivisorDeFrecuencia 
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
module DivisorDeFrecuencia(
	input wire clk,         //Se�al de entrada, referente a comportamiento de reloj.
	input wire reset,       //Reset de se�al.
	input wire [5:0] FreqDivValue,
	output reg FreqDividida = 1'b0 //Se�al de salida del divisor, se�al ya dividida.
	
    );
/* El codigo de este m�dulo corresponde a dividir la frecuencia de entrada en n veces, ejemplo: 100Mhz => 20Mhz.
 
     Si se desea dividir en otra cantidad, por ejemplo: en 354, primero se saca la base 2 de ese numero
		 para poder obtener la cantidad del largo del bus datos referente a la salida del contador
		 log2(354) = 8.4676 => por lo que se toma el numero entero posterior al resultado, osea 9
     Por lo que las siguientes lineas de c�digo tendria se cambiar�an por lo siguiente:

     linea  |  Cambio
     -------+----------------------------
		  45    |    reg [8:0] cuenta;
	 	  58    |    if (cuenta == 9'd353) lo �nico a considerar es que para este caso esto se define en otro m�dulo. 
   	  61    |    cuenta <= 9'h0; 
		  
Para no dar espacio a alguna ambiguedad, el valor al que se le saca la base, corresponde al factor a dividir,
ejemplo del valor descrito en el caso anterior, corresponde a una freceuncia de 282kHz.		  */


reg [5:0] cuenta = 6'b0; /*Bus de datos de 12 bits referente al contador
							para una unidad decimal maxima de 4096 (2^12 = 4096) suficiente para la cuenta de 3334
							que es el valor m�s alto necesario para la divisi�n*/
 
always @(posedge clk,posedge reset) //Se procede a realizar el codigo posterior siempre que "clk" o "reset" est�n en alto.
	begin
		if (reset) //Si "reset" est� en alto, se pone la salida "s_clk" en 0 y se resetea la cuenta.
			begin
				FreqDividida <= 0;
				cuenta <= 0;
			end 
		else //Se est� en alto la se�al de "clk" pero no la de "reset" se procede a realizar lo siguiente.
			begin		
				if (cuenta == FreqDivValue)//(3334)-1 = 3333, Si el contador llega a la cuenta 3334:   
					//Por si las dudas, cuando se habla de => "3'd4"(notaci�n decimal) es igual a "3'b100"(notaci�n binaria). 
					begin                    
						cuenta <= 7'h0;  //Se hace un reset de la cuenta poniendola en cero.   
						FreqDividida <= ~FreqDividida;  //
					end 
				else 
					cuenta <= cuenta + 1'b1; //De no ser el valor a dividir, el contador seguir� contando (valga la redundancia)
			end
	end
 
endmodule
