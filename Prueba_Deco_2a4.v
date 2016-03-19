`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:36:16 03/13/2016
// Design Name:   Deco_2_a_4
// Module Name:   E:/PROYECTOS_XILINX_TEC/DPWM/Prueba_Deco_2a4.v
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

module Prueba_Deco_2a4;

	// Inputs
	reg [1:0] IN;
	reg EN;

	// Outputs
	wire [3:0] OUT;

	// Instantiate the Unit Under Test (UUT)
	Deco_2_a_4 uut (
		.IN(IN), 
		.EN(EN), 
		.OUT(OUT)
	);

	initial begin
		// Initialize Inputs
		IN = 0;
		EN = 1;
	   #10 IN = 0;
		#10 IN = 1;
		#10 IN = 2;
		#10 IN = 3;
		#10 EN=0;
		#10 EN=1;
   end
	
	
	
      
endmodule

