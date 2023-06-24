module cpu(
	input clk,
	input rst,
	output wire [7:0] pc
);

wire [2:0] RA, RB, RW;
wire [15:0] busW;
wire WE, RD;
wire [15:0] busA, busB;
wire [15:0] accout;
wire [2:0] aluop;
wire stop, pcJMP, banEBL, ban, ena, enable;
wire [15:0] outins;
wire [1:0] accop;
wire [5:0] r1;
wire [7:0] r2;
wire [15:0] dataout, out1, out2;

alu malu(.outalu(out1),.a(accout),.b(out2),.select(aluop));
pc mpc(.stop(stop),.clk(clk),.rst(rst),.pcJMP(pcJMP),.banEBL(banEBL),.ban(ban),.data_in(r2),.pc(pc));
ins mins(.outins(outins),.adder(pc),.r1(r1),.r2(r2),.clk(clk));
cu mcu(.accout(accout),.outins(outins),.stop(stop),.accop(accop),.ena(ena),.aluop(aluop),.enable(enable),.pcJMP(pcJMP),.banEBL(banEBL),.ban(ban));
acc myacc(.ena(ena),.accop(accop),.accin(out1),.acc(accout));
register mregister(RA, RB, RW, busW, clk, WE, busA, busB, RD);
Datastorage mDatastorage(.address(r1),.enable(enable),.clk(clk),.dataout(dataout),.datain(accout));

endmodule 