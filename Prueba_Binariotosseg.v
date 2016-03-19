`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:13:15 03/12/2016
// Design Name:   Deco_BinariotoSseg
// Module Name:   E:/PROYECTOS_XILINX_TEC/DPWM/Prueba_Binariotosseg.v
// Project Name:  DPWM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Deco_BinariotoSseg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Prueba_Binariotosseg;

	// Inputs
	reg [3:0] bin;

	// Outputs
	wire [6:0] sseg;

	// Instantiate the Unit Under Test (UUT)
	Deco_BinariotoSseg uut (
		.bin(bin), 
		.sseg(sseg)
	);

	initial begin
		// Initialize Inputs
		bin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

