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
	 always @ * begin
	 case({alu_op,instruction_5_0}) begin
			7'b00XXXXXX: alu_out <= 4'b0010;
			7'bX1XXXXXX: alu_out <= 4'b0110;
			7'b1XXX0000: alu_out <= 4'b0010;
			7'b1XXX0010: alu_out <= 4'b0110;
			7'b1XXX0100: alu_out <= 4'b0000;
			7'b1XXX0101: alu_out <= 4'b0001;
			7'b1XXX1010: alu_out <= 4'b0111;
			7'b1XXX0111: alu_out <= 4'b1100;
	 
	 endcase

end
endmodule
