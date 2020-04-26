`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:41:12 04/25/2020 
// Design Name: 
// Module Name:    controlUnit 
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
module controlUnit(
	input wire [5:0] instr_op,
	output reg reg_dst,
	output reg branch,
	output reg mem_read,
	output reg mem_to_reg,
	output reg [1:0] alu_op,
	output reg mem_write,
	output reg alu_src,
	output reg reg_write
    );
	 
	 always @* begin
	 case(instr_op)
	  6'b000000: begin
		reg_dst <= 1;
		alu_src <= 0;
		mem_to_reg <= 0;
		reg_write <= 1;
		mem_read <= 0;
		mem_write <= 0;
		branch <= 0;
		alu_op[1:0] <= 2'b00;
	  end
	  6'b100011: begin
		reg_dst <=0;
		alu_src <= 1;
		mem_to_reg <=1;
		reg_write <=1;
		mem_read <=1;
		mem_write <= 0;
		branch <= 0;
		alu_op[1:0] <= 2'b00;
		end
		6'b101011: begin
		reg_dst <=1'bX;
		alu_src <= 1;
		mem_to_reg <=1'bX;
		reg_write <=0;
		mem_read <=0;
		mem_write <= 0;
		branch <= 0;
		alu_op[1:0] <= 2'b00;
		end
		6'b000100: begin
		reg_dst <=1'bX;
		alu_src <= 0;
		mem_to_reg <=1'bX;
		reg_write <=0;
		mem_read <=0;
		mem_write <= 0;
		branch <= 1;
		alu_op[1:0] <= 2'b01;
		end
		6'b001000: begin
			reg_dst <=1'bX;
			alu_src <= 0;
			mem_to_reg <=1'bX;
			reg_write <=0;
			mem_read <=0;
			mem_write <= 0;
			branch <= 1;
			alu_op[1:0] <= 2'b01;
		end
		
		
	  endcase
	 end


endmodule
