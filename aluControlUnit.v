`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:08:31 04/25/2020 
// Design Name: 
// Module Name:    aluControlUnit 
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
module aluControlUnit(
		input wire [1:0] alu_op,
		input wire [5:0] instruction_5_0,
		output reg [3:0] alu_out
    );
	 always @* begin
	 if ( {alu_op,instruction_5_0} >= 8'b00_0000_00 &&
			{alu_op,instruction_5_0} <= 8'b0100_0000) begin
				alu_out = 4'b0010;
	end
		 if ( {alu_op,instruction_5_0} >= 8'b0100_0000 &&
			{alu_op,instruction_5_0} <= 8'b0111_1111) begin
				alu_out = 4'b0110;
	end
			 if ( {alu_op,instruction_5_0} >= 8'b1000_0000 &&
			{alu_op,instruction_5_0} <= 8'b1111_0000) begin
				alu_out = 4'b0010;
	end
				 if ( {alu_op,instruction_5_0} >= 8'b1000_0010 &&
			{alu_op,instruction_5_0} <= 8'b1111_0010) begin
				alu_out = 4'b0110;
	end
				 if ( {alu_op,instruction_5_0} >= 8'b1000_0100 &&
			{alu_op,instruction_5_0} <= 8'b1111_0100) begin
				alu_out = 4'b0000;
	end
					 if ( {alu_op,instruction_5_0} >= 8'b1000_0101 &&
			{alu_op,instruction_5_0} <= 8'b1111_0101) begin
				alu_out = 4'b0001;
	end
						 if ( {alu_op,instruction_5_0} >= 8'b1000_1010 &&
			{alu_op,instruction_5_0} <= 8'b1111_1010) begin
				alu_out = 4'b0111;
	end
						 if ( {alu_op,instruction_5_0} >= 8'b1000_0111 &&
			{alu_op,instruction_5_0} <= 8'b1111_0111) begin
				alu_out = 4'b1100;
	end
			

end
endmodule
