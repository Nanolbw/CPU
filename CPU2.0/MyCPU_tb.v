module MyCPU_tb;
parameter CYCLE = 20;
reg clk;
wire [7:0] pc;
reg rst;

cpu MyCPU(clk, rst, pc);

initial clk = 0;
//always #20 clk = ~clk;
always #(CYCLE/2) clk = ~ clk;

initial begin
	clk = 1;
	rst = 0;
	#(CYCLE*1) 
	clk = 1;
	rst = 1;
	#(CYCLE*2) 
	rst = 0;
	#(CYCLE*3) 
	rst = 0;
	#(CYCLE*4) 
	rst = 0;
	#(CYCLE*5) 
	rst = 1;
	#(CYCLE*6) 
	rst = 0;
	#(CYCLE*7) 
	rst = 0;
	#(CYCLE*8) 
	rst = 0;
	#(CYCLE*9) 
	rst = 1;
	#(CYCLE*9)
	rst = 0;
	force MyCPU.r1 = 7'h5;
	force MyCPU.r2 = 8'h9;

	#(CYCLE*10)
	force MyCPU.outins = 16'h0600;//16'h0500
	force MyCPU.banEBL = 1;
	
	#(CYCLE*12)
	force MyCPU.accout[7] = 1;
	force MyCPU.r2 = 16'h2;

	#(CYCLE*13)
	//force MyCPU.accout[7] = 1;
	force MyCPU.outins = 16'h0902;
	
	//force MyCPU.outins = 16'hffff;//.outins(16'hffff);	

	#(CYCLE*14)
	force MyCPU.outins = 16'hffff;
	
	#(CYCLE*20)
	$stop;
	
end
endmodule 
//module MyCPU_tb;
//  parameter CYCLE = 32;
  
//  reg clk;
//  wire [7:0] pc;
//  reg rst;
  
//  cpu MyCPU(clk, rst, pc);
  
//  initial clk = 0;
//  always #(CYCLE/2) clk = ~clk;
  
//  initial begin
//    clk = 1;
//    rst = 0;
//    #(CYCLE*1) 
//    clk = 1;
//    rst = 1;
//    #(CYCLE*2) 
//    rst = 0;
    
//    // 设置寄存器初始值
//    force MyCPU.r1 = 8'h00;
//    force MyCPU.r2 = 8'h00;
    
//    // 执行指令
//    #(CYCLE*3)
//    force MyCPU.outins = 16'h0100; // CLA
    
//    #(CYCLE*4)
//    force MyCPU.outins = 16'h0200; // COM
    
//    #(CYCLE*5)
//    force MyCPU.outins = 16'h0300; // SHR
    
//    #(CYCLE*6)
//    force MyCPU.outins = 16'h0400; // CSL
    
//    #(CYCLE*7)
//    force MyCPU.outins = 16'h0500; // ADD
    
//    #(CYCLE*8)
//    force MyCPU.outins = 16'h0600; // STA
    
//    #(CYCLE*9)
//    force MyCPU.outins = 16'h0701; // LDA
    
//    #(CYCLE*10)
//    force MyCPU.outins = 16'h0803; // JMP
    
//    #(CYCLE*11)
//    force MyCPU.outins = 16'h0902; // BAN
    
//    #(CYCLE*12)
//    force MyCPU.outins = 16'h0aff; // STOP
    
//    #100; // 延迟100个时钟周期
    
//    $finish;
//  end
//endmodule
