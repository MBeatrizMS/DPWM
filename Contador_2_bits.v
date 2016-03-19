`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:26:57 03/14/2016 
// Design Name: 
// Module Name:    Contador_2_bits 
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
module Contador_2_bits(
 input wire clk,
 input wire rst,
 output reg [1:0]Count=0
);

always @(posedge clk)
      if (!rst)
         Count <= 0;
      else
         Count <= (Count + 1'd1);
endmodule





