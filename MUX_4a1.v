`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:51:48 03/12/2016 
// Design Name: 
// Module Name:    MUX_4a1 
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
module MUX_4a1(
input wire [3:0]I0,I1,I2,I3,
input wire [1:0]S,
output reg [3:0]Y
);

always @(S,I0,I1,I2,I3)
      case (S)
         2'b00: Y = I0;
         2'b01: Y = I1;
         2'b10: Y = I2;
         2'b11: Y = I3;
      endcase
endmodule
