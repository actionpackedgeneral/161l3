module aluControl  (
    input wire [1:0] alu_op , 
    input wire [5:0] instruction_5_0 , 
    output wire [3:0] alu_out  
    );

// ------------------------------
// Insert your solution below
// ------------------------------ 
	assign alu_out = 3'b000;
endmodule
