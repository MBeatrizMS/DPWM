`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:57 03/13/2016 
// Design Name: 
// Module Name:    Divisor_Frecuencia 
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
module Divisor_Frecuencia(
    input wire CLK_IN,
    output reg CLK_OUT=0
   );
	
	 reg [17:0]contador=0; // El contador es de 18 bits llega hasta el numero 262144
    
	 always @(posedge CLK_IN)
		if(contador == 18'd200000) //Ponemos a m=200000, el cual es el numero del contador que divide la frecuencia de 100MHz a 250 Hz
         begin
		   contador <= 18'd0; 
         CLK_OUT <= ~CLK_OUT;
			end
		else 
			begin
			contador <= contador + 1'd1;
			end 
endmodule   
	 
	 
	 
	