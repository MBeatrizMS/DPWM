`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:49:40 03/14/2016
// Design Name:   Convertidor_Binario_BCD
// Module Name:   E:/PROYECTOS_XILINX_TEC/DPWM/prueba_converter.v
// Project Name:  DPWM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Convertidor_Binario_BCD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module prueba_converter;

	// Inputs
	reg [9:0] N_Binario;

	// Outputs
	wire [3:0] Millares;
	wire [3:0] Centenas;
	wire [3:0] Decenas;
	wire [3:0] Unidades;

	// Instantiate the Unit Under Test (UUT)
	Convertidor_Binario_BCD uut (
		.N_Binario(N_Binario), 
		.Millares(Millares), 
		.Centenas(Centenas), 
		.Decenas(Decenas), 
		.Unidades(Unidades)
	);

	initial begin
		// Initialize Inputs
		N_Binario = 0;
		#10 N_Binario = 1011;
		#10 N_Binario = 1023;
		#10 N_Binario = 6;
		#10 N_Binario = 17;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

