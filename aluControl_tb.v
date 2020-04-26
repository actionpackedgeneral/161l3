
  
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:11:51 04/19/2020 
// Design Name: 
// Module Name:    aluControl_tb 
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
module aluControl_tb;
	reg [1:0] alu_op;
	reg [5:0] instruction_5_0;
	wire [3:0] alu_out;
	reg [5:0] instr_op;
	wire reg_dst;
	wire branch;
	wire mem_read;
	wire mem_to_reg;
	wire mem_write;
	wire alu_src;
	wire reg_write;

	aluControlUnit aluControlUnit(
	 .alu_op(alu_op) , 
    .instruction_5_0(instruction_5_0) , 
    .alu_out(alu_out)
    );
	 
	  controlUnit  controlUnit(
		.instr_op(instr_op) , 
		.reg_dst(reg_dst),   
		.branch(branch)    ,     
		.mem_read(mem_read) ,  
		.mem_to_reg(mem_to_reg) ,
		.alu_op(alu_op)  ,        
		.mem_write(mem_write), 
		.alu_src(alu_src),    
		.reg_write(reg_write)   
    );

	 
integer totalTests,failedTests;
initial begin
	totalTests = 0;
	failedTests = 0;
$write("instruction = 6'b00000");
alu_op = 2'b00;
instruction_5_0 = 6'b0000_00;
			instr_op = 6'b00000;
        if (reg_dst && !alu_src && !mem_to_reg &&
				reg_write && !mem_read && !mem_write &&
				!branch && (alu_op == 2)) begin
            $display("passed"); 
            
				end
         else begin
            $display("failed");
				failedTests = failedTests + 1;
        end
totalTests = totalTests + 1;
#100;
$write("instruction = 6'b101011");
			instr_op = 6'b101011;
        if (//reg_dst &&
			   alu_src && 
				//mem_to_reg &&
				!reg_write && 
				!mem_read && 
				mem_write &&
				!branch && 
				(alu_op == 0)
				) begin
            $display("passed"); 
            
				end
         else begin
            $display("failed");
				failedTests = failedTests + 1;
        end
totalTests = totalTests + 1;
#100;
$write("instruction = 6'b100011");
			instr_op = 6'b100011;
        if (!reg_dst &&
			   alu_src && 
				mem_to_reg &&
				reg_write && 
				mem_read && 
				mem_write &&
				!branch && 
				(alu_op == 0)
				) begin
            $display("passed"); 
            
				end
         else begin
            $display("failed");
				failedTests = failedTests + 1;
        end
totalTests = totalTests + 1;
#100;
$write("instruction = 5'b000100");
			instr_op = 6'b100011;
        if (//reg_dst &&
			   !alu_src && 
				//mem_to_reg &&
				!reg_write && 
				!mem_read && 
				!mem_write &&
				branch && 
				(alu_op == 1)
				) begin
            $display("passed"); 
            
				end
         else begin
            $display("failed");
				failedTests = failedTests + 1;
        end
totalTests = totalTests + 1;
#100;
$write("alu_instruction: 00");
	alu_op = 2'b00;
	if(alu_out == 4'b0010) begin
		$display("passed");
		end
	else begin
		$display("failed");
		failedTests = failedTests + 1;
		end
	totalTests = totalTests + 1;
	#100;
$write("alu_instruction: X1");
	alu_op = 2'b01;
	if(alu_out == 4'b0110) begin
		$display("passed");
		end
	else begin
		$display("failed");
		failedTests = failedTests + 1;
		end
	totalTests = totalTests + 1;
	#100;
$write("alu_instruction: 1X instruction 5_0: XX0000 ");
	alu_op = 2'b11;
	instruction_5_0 = 6'b110000;
	if(alu_out == 4'b0010) begin
		$display("passed");
		end
	else begin
		$display("failed");
		failedTests = failedTests + 1;
		end
	totalTests = totalTests + 1;


end

endmodule