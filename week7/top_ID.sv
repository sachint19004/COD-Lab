`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2024 14:20:50
// Design Name: 
// Module Name: top_ID
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

module ID(data, f3, f7, opcode,RegWrite, Imm, reg1,reg2, datain,clk);
	input logic [31:0] data;
	output logic [2:0] f3;
	output logic [6:0] f7;
	output logic [6:0] opcode;
	input bit RegWrite;
	input bit clk;
	output logic [31:0] Imm;
	output logic [31:0] reg1;
	output logic [31:0] reg2;
	input logic [31:0] datain;
	logic [31:0] inst;
	logic [4:0] rs1;
	logic [4:0] rs2;
	logic [4:0] rd;
	decode_unit dec(.inp(data), .opcode(opcode), .out(inst), .rs1(rs1), .rs2(rs2), .rd(rd), .fun_3(f3), .fun_7(f7));
	//decoder dec(.(data), .(opcode), .(inst), .(rs1), .(rs2), .(rd), .(f3), .(f7));
	SignExtender sext(.opcode(opcode), .instIn(inst), .immOut(Imm));
	Registers regfile(.rs1(rs1),.rs2(rs2),.RegWrite(RegWrite),.rd(rd),.clk(clk),.reg1(reg1),.reg2(reg2),.datain(datain));
endmodule
