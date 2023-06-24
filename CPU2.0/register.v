module register(RA, RB, RW, busW, clk, WE, busA, busB, RD);
input wire [2:0] RA, RB, RW;
input wire [15:0] busW;
input clk, WE, RD;
output reg [15:0] busA, busB;

reg [15:0] Reg[7:0];

always  @(negedge clk)
begin 
	if(WE == 1)
	begin
	  Reg[RW] = busW;
	  busA = Reg[RA];
	  busB = Reg[RB];
	end else if(RD == 1)begin	
	  busA = Reg[RA];
	  busB = Reg[RB];
	end
end

endmodule 