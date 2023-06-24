`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/20 20:52:11
// Design Name: 
// Module Name: mycpu
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


module mycpu(

    input wire clk,
    input wire rst
//    input wire [3:0] data_in,
//    output wire [3:0] data_out,
//    output wire [3:0] PC
); 
    reg [7:0] ACC;
    reg [7:0] MDR;
    reg [3:0] MAR;
    reg [7:0] IR;
    reg [3:0] PC;
    reg [7:0] storage[0:127];
//    initial begin
//        storage[4'h0]=8'h00;//acc ->0
//        storage[4'h1]=8'h10;//~acc
//        storage[4'h2]=8'h20;//->
//        storage[4'h3]=8'h30;//<-
//        storage[4'h4]=8'h40;//op
//        storage[4'h5]=8'h50;//add
//        storage[4'h6]=8'h60;//a
//        storage[4'h7]=8'h70;//lda
//        storage[4'h8]=8'h80;//jmp
//        storage[4'h9]=8'h90;//ban
//     end
     initial begin
        storage[4'b0000]=8'b01111001;
        storage[4'b0001]=8'b01011010;
        storage[4'b0010]=8'b01101010;
        storage[4'b0011]=8'b01111001;
        storage[4'b0100]=8'b01011011;
        storage[4'b0101]=8'b10011000;
        storage[4'b0110]=8'b01101001;
        storage[4'b0111]=8'b10000001;
        storage[4'b1000]=8'b01001111;
        storage[4'b1001]=8'b00011001;
        storage[4'b1010]=8'b00000000;
        storage[4'b1011]=8'b11111111;
     end
    always @(posedge clk ) begin
        if (rst) begin
            ACC <= 8'b0;
            MDR <= 8'b0;
            MAR <= 4'b0;
            IR <= 8'b0;
            PC <= 4'b0;
        end else begin
            //MDR <= data_in;
            
            // Fetch Instruction
            if (PC < 4'b1110) begin
                MAR = PC;
                MDR=storage[MAR];
                IR = MDR;
                PC = PC + 1;
            end else begin
                MAR = 4'b0;
                IR = 8'b0;
                PC = 4'b0;
            end
            
            // Instruction Decode
            case (IR[7:4])
                4'b0000: ACC = 8'b00000000;    // CLA
                4'b0001: ACC = ~ACC;          // COM
                4'b0010: ACC = {ACC[7], ACC[7:1]};  // SHR
                4'b0011: ACC = {ACC[6:0], ACC[7]};  // CSL
                4'b0100: $finish;              // STP
                4'b0101: begin
                MDR=storage[IR[3:0]];
                ACC = ACC + MDR ; // ADD
                
                end
                4'b0110: storage[IR[3:0]] = ACC;           // STA
                4'b0111:begin
                 MDR=storage[IR[3:0]];           // LDA
                 ACC=MDR;
                 end
                4'b1000: PC = 1;            // JMP
                4'b1001: if (ACC[7]) PC = PC + 2;  // BAN
                default: ACC = ACC;
            endcase
        end
    end
    
    //assign data_out = ACC;
endmodule
