`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:50:41 03/12/2016 
// Design Name: 
// Module Name:    Deco_2_a_4 
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
module Deco_2_a_4(
   input wire [1:0]IN,
	input wire EN,
	output reg [3:0]OUT
   );
	
	always @ *
      if (!EN)
         OUT <= 4'h0;
      else
         case (IN)
            2'b00   : OUT <= 4'b1110;
            2'b01   : OUT <= 4'b1101;
            2'b10   : OUT <= 4'b1011;
            2'b11   : OUT <= 4'b0111;
            default : OUT <= 4'b1111;
         endcase
endmodule
