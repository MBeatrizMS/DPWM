`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:38:19 03/13/2016
// Design Name:   Deco_2_a_4
// Module Name:   E:/PROYECTOS_XILINX_TEC/DPWM/Prueba_Deco_2_a_4.v
// Project Name:  DPWM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Deco_2_a_4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Prueba_Deco_2_a_4;

	// Inputs
	reg [1:0] IN;
	reg rst;

	// Outputs
	wire [3:0] OUT;

	// Instantiate the Unit Under Test (UUT)
	Deco_2_a_4 uut (
		.IN(IN), 
		.rst(rst), 
		.OUT(OUT)
	);

	initial begin
		// Initialize Inputs
		IN = 0;
		rst = 0;
   end
      
endmodule

