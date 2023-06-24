`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/21 11:04:37
// Design Name: 
// Module Name: mycpu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mycpu_tb;
parameter CYCLE = 20;
reg clk;

reg rst;

mycpu mycpu(clk, rst);

//initial clk = 0;
//always #20 clk = ~clk;
always #(CYCLE/2) clk = ~ clk;

initial begin
	clk = 1;
	rst = 0;
//	#(CYCLE*1) 
//	clk = 1;

//	#(CYCLE*2) 

//	#(CYCLE*3) 

//	#(CYCLE*4) 

//	#(CYCLE*5) 

//	#(CYCLE*6) 
//	rst = 0;
//	#(CYCLE*7) 
//	rst = 0;
//	#(CYCLE*8) 
//	rst = 0;
//	#



	

	
end
endmodule
