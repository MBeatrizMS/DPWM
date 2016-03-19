`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:26:12 03/12/2016 
// Design Name: 
// Module Name:    Deco_BinariotoSseg 
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
module Deco_BinariotoSseg(
input wire [3:0] bin,
output reg [6:0] sseg 
);

always @*
begin
	case (bin)              //abcdefg
		4'b0000: sseg[6:0] = 7'b0000001;//0
		4'b0001: sseg[6:0] = 7'b1001111;//1
		4'b0010: sseg[6:0] = 7'b0010010;//2
		4'b0011: sseg[6:0] = 7'b0000110;//3
		4'b0100: sseg[6:0] = 7'b1001100;//4
		4'b0101: sseg[6:0] = 7'b0100100;//5
		4'b0110: sseg[6:0] = 7'b0100000;//6   
		4'b0111: sseg[6:0] = 7'b0001111;//7 
		4'b1000: sseg[6:0] = 7'b0000000;//8
		4'b1001: sseg[6:0] = 7'b0000100;//9
		default: sseg[6:0] = 7'b0111000;//f 
	endcase
end
endmodule
