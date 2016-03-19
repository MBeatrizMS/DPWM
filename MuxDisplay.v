`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:31:51 03/16/2016 
// Design Name: 
// Module Name:    MuxDisplay 
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
module MuxDisplay(
	input wire Selector,
	input wire [9:0] Frecuencia,
	input wire [9:0] Corriente,
	output wire [9:0] Salida
    );

assign Salida = Selector ? Frecuencia : Corriente;

endmodule
