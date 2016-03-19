`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:25:51 02/28/2016 
// Design Name: 
// Module Name:    MaquinaPWM 
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
module MaquinaPWM(
	 input wire clk,reset,
	 input wire PushBottonUp, PushBottonDown,
	 output reg [9:0] Comparar = 10'd0 //Log en base dos de mil, da 9,96 aprox 10 bits.
);

reg [9:0] CompararPresente = 10'd0;
reg [9:0] CompararProximo = 10'd0;

// Asignaciòn de estados
localparam [1:0]

ESPERA=2'b00,
SUMA=2'b01,
RESTA=2'b10;



// Asignaciòn de los cambios de estado
reg[1:0] ESTADO_PRESENTE = 2'd0;
reg[1:0] ESTADO_PROXIMO = 2'd0;


//Funcionamiento de la parte secuencial de la màquina de estados
always@(posedge clk ,posedge reset) //Parte secuencial

     if(reset)
			begin
	        ESTADO_PRESENTE<=ESPERA;
			  CompararPresente<=10'd0;
			end

	  else 
			begin
	        ESTADO_PRESENTE<=ESTADO_PROXIMO;
			  if (CompararProximo==10'd1001)
					CompararPresente<=10'd0;
			  else if (CompararProximo==10'd1023)
					CompararPresente<=10'd1000;
			  else
					CompararPresente<=CompararProximo;
			end

//Parte combinacional de Cambio de estado 
always@*
	begin
		ESTADO_PROXIMO = 2'd0;
		CompararProximo = 10'd0;
	
		case(ESTADO_PRESENTE)
	
			ESPERA:
			begin
				CompararProximo=CompararPresente;			
				if(PushBottonUp)
					ESTADO_PROXIMO=SUMA;
				else if(PushBottonDown)
					ESTADO_PROXIMO=RESTA;
				else
					ESTADO_PROXIMO=ESPERA;
			end
		
			SUMA:
				begin
					ESTADO_PROXIMO=ESPERA;
					CompararProximo = CompararPresente + 1'd1;
				end

			RESTA:
				begin
					ESTADO_PROXIMO=ESPERA;
					CompararProximo = CompararPresente - 1'd1; 
				end
			
			default:
				begin
					ESTADO_PROXIMO=ESPERA;
					CompararProximo = 10'd0;
				end	
		endcase
	end
	
always@* Comparar <= CompararPresente;

endmodule
