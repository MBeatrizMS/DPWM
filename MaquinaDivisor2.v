`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:58:33 02/28/2016 
// Design Name: 
// Module Name:    MaquinaDivisor 
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
module MaquinaDivisor2(

	 input wire clk,reset,
	 input wire PushBottonUp, PushBottonDown,
	 output reg [5:0] FreqDivValue = 6'd0,
	 output reg [9:0] Freq = 10'd0
);

// Asignaciòn de estados
localparam [2:0]

TREINTA=3'b000,
CINCUENTA=3'b001,
SETENTAYCINCO=3'b010,
CIEN=3'b011,
CIENTOVEINTICINCO=3'b100,
CIENTOCINCUENTA=3'b101,
CIENTOSETENTAYCINCO=3'b110,
DOSCIENTOS=3'b111;


// Asignaciòn de los cambios de estado
reg[2:0] ESTADO_PRESENTE = 3'd0;
reg[2:0] ESTADO_PROXIMO = 3'd0;

//Funcionamiento de la parte secuencial de la màquina de estados
always@(posedge clk ,posedge reset)

     if(reset)
	        ESTADO_PRESENTE<=TREINTA;
	  else
	        ESTADO_PRESENTE<=ESTADO_PROXIMO;			


//Parte combinacional de Cambio de estado 
/* Asignación de salidas, es una declaraciòn de cuanto
	debe ser el factor a dividir para lograr una frecuencia en especifico.
	Màs adelante se debe restar un uno ya que lee desde el cero, ademàs de
	que este serà el que pase al siguiente modulo*/

always@*

	begin
		ESTADO_PROXIMO = 3'd0;
		FreqDivValue = 6'd0;
		case(ESTADO_PRESENTE)
	
			TREINTA:
				begin
					Freq=10'b0000011110;
					FreqDivValue = 6'd32;
					if(PushBottonUp)
						ESTADO_PROXIMO = CINCUENTA;
					else if(PushBottonDown)
						ESTADO_PROXIMO = DOSCIENTOS;
					else
						ESTADO_PROXIMO = TREINTA;
				end	
			CINCUENTA:
				begin
					Freq=10'b0000110010;
					FreqDivValue = 6'd19;
					if(PushBottonUp)
						ESTADO_PROXIMO = SETENTAYCINCO;
					else if(PushBottonDown)
						ESTADO_PROXIMO = TREINTA;
					else
						ESTADO_PROXIMO = CINCUENTA;
				end
			SETENTAYCINCO:
				begin
					Freq=10'b0001001011;
					FreqDivValue = 6'd12; 
					if(PushBottonUp)
						ESTADO_PROXIMO = CIEN;
					else if(PushBottonDown)
						ESTADO_PROXIMO = CINCUENTA;
					else
						ESTADO_PROXIMO = SETENTAYCINCO;
				end
			CIEN:
				begin
					Freq=10'b0001100100;
					FreqDivValue = 6'd9;			
					if(PushBottonUp)
						ESTADO_PROXIMO = CIENTOVEINTICINCO;	
					else if(PushBottonDown)
						ESTADO_PROXIMO = SETENTAYCINCO;
					else
						ESTADO_PROXIMO = CIEN;
				end		
			CIENTOVEINTICINCO:
				begin	
					Freq=10'b0001111101;
					FreqDivValue = 6'd7; 	
					if(PushBottonUp)
						ESTADO_PROXIMO = CIENTOCINCUENTA;	
					else if(PushBottonDown)
						ESTADO_PROXIMO = CIEN;
					else
						ESTADO_PROXIMO = CIENTOVEINTICINCO;
				end
			CIENTOCINCUENTA:
				begin
					Freq=10'b0010010110;
					FreqDivValue = 6'd6;		
					if(PushBottonUp)
						ESTADO_PROXIMO = CIENTOSETENTAYCINCO;	
					else if(PushBottonDown)
						ESTADO_PROXIMO = CIENTOVEINTICINCO;
					else
						ESTADO_PROXIMO = CIENTOCINCUENTA;
				end
			CIENTOSETENTAYCINCO:
				begin	
					Freq=10'b0010101111;
					FreqDivValue = 6'd5;
					if(PushBottonUp)
						ESTADO_PROXIMO = DOSCIENTOS;	
					else if(PushBottonDown)
						ESTADO_PROXIMO = CIENTOCINCUENTA;
					else
						ESTADO_PROXIMO = CIENTOSETENTAYCINCO;
				end
			DOSCIENTOS:
				begin
					Freq=10'b0011001000;
					FreqDivValue = 6'd4; 		
					if(PushBottonUp)
						ESTADO_PROXIMO = TREINTA;
					else if(PushBottonDown)
						ESTADO_PROXIMO = CIENTOSETENTAYCINCO;
					else
						ESTADO_PROXIMO = DOSCIENTOS;
				end
			default:
				begin
					Freq=10'b0000011110;
					FreqDivValue = 6'd32;
					ESTADO_PROXIMO = TREINTA;
				end
		
		endcase
	end	

endmodule
