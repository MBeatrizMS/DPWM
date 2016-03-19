`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:13:23 03/14/2016 
// Design Name: 
// Module Name:    Convertidor_Binario_BCD 
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

module Convertidor_Binario_BCD(
   input  [9:0] N_Binario,
   output reg [3:0] Millares,
	output reg [3:0] Centenas,
   output reg [3:0] Decenas,
   output reg [3:0] Unidades
   );
   // Se crea un registro interno para alli ejecutar el algoritmo
   reg [25:0] shiftreg;
   integer i;
   
   always @(N_Binario)
   begin
      
      shiftreg[25:0] = 0; 
      shiftreg[9:0] = N_Binario;
      
      // Se hace un ciclo for para ejecutar el algoritmo las veces necesarias hasta obtener el numero en BCD
      for (i=0; i<=9; i=i+1) // Se ejecuta el algoritmo 10 veces por el numero binario ingresado es de 10 bits
		begin
         if (shiftreg[25:22] >= 5) //SE REVISAN LOS MILLARES
            shiftreg[25:22] = shiftreg[25:22] + 2'd3; // Aqui es donde se suma 3
            
         if (shiftreg[21:18] >= 5) //SE REVISAN LAS CENTENAS
            shiftreg[21:18] = shiftreg[21:18] + 2'd3;
            
         if (shiftreg[17:14] >= 5)//SE REVISAN LAS DECENAS
            shiftreg[17:14] = shiftreg[17:14] + 2'd3; 
				
			if (shiftreg[13:10] >= 5)// SE REVISAN LAS UNIDADES
            shiftreg[13:10] = shiftreg[13:10] + 2'd3;
		   
		  // Se hace el corrimiento correspondiente hacia la izquierda
         shiftreg = shiftreg << 1;  
      end 
      
      // Cuando el ciclo termine ya se tendran en el registro el numero en BCD.
      Millares = shiftreg[25:22];
   	Centenas = shiftreg[21:18];
      Decenas  = shiftreg[17:14];
      Unidades  = shiftreg[13:10];
   end
endmodule
