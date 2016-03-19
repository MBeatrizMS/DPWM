`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:01:26 03/15/2016 
// Design Name: 
// Module Name:    Selector 
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
module Selector(
	input wire Selector,
	input wire PushUp,
	input wire PushDown,
	output reg PU1,
	output reg PD1,
	output reg PU2,
	output reg PD2
    );
	 
always @*

	if (Selector) 
		begin
			PU1=PushUp;
			PD1=PushDown;
			PU2=1'b0;
			PD2=1'b0;
		end
	
	else	
		begin
			PU1=1'b0;
			PD1=1'b0;
			PU2=PushUp;
			PD2=PushDown;
		end

endmodule
