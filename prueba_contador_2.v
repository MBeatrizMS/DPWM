`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:02:46 03/14/2016
// Design Name:   Contador_2_bits
// Module Name:   E:/PROYECTOS_XILINX_TEC/DPWM/prueba_contador_2.v
// Project Name:  DPWM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Contador_2_bits
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module prueba_contador_2;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [1:0] Count;

	// Instantiate the Unit Under Test (UUT)
	Contador_2_bits uut (
		.clk(clk), 
		.rst(rst), 
		.Count(Count)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		#10 rst=1;
	end
	
	always begin
	#5 clk=~clk;
	end
      
      
endmodule

