`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:07:39 03/14/2016
// Design Name:   Divisor_Frecuencia
// Module Name:   E:/PROYECTOS_XILINX_TEC/DPWM/prueba_divisor_2.v
// Project Name:  DPWM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Divisor_Frecuencia
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module prueba_divisor_2;

	// Inputs
	reg CLK_IN;

	// Outputs
	wire CLK_OUT;
	wire [18:0] contador;

	// Instantiate the Unit Under Test (UUT)
	Divisor_Frecuencia uut (
		.CLK_IN(CLK_IN), 
		.CLK_OUT(CLK_OUT), 
		.contador(contador)
	);

	initial begin
		// Initialize Inputs
		CLK_IN = 0;

		// Wait 100 ns for global reset to finish
		#100;
   end
	
	always begin
	#5 CLK_IN=~CLK_IN;
	end
      
endmodule

