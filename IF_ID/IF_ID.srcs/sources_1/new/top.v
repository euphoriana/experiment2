`timescale 1ns / 1ps

 module top(input clk,
           input rst,
           output regdst,
           output regwrite,
           output alusrc,
           output memwrite,
           output memtoreg,
           output branch,
           output jump,
           output [2:0] alucontrol,
           output [31:0] inst);

// pc��ӷ���
// pc �����byte��32bit(4Byte)�ĵ�ַ��Ӧpc��4λ��ÿ�μ�4��byte
wire [7:0] pc;
wire [7:0] pc_next; // ��һ�����ڵ�pcֵ
wire inst_ce; // ��ָ��洢����ʹ�ܿ���

pc_add pc_add(pc,8'h04,pc_next);
//assign pc_next=pc+8'h04;

pc_model pc_model(
    .clk(clk),
    .rst(rst),
    .d(pc_next),
    .pc(pc),
    .inst_ce(inst_ce)
);

//ָ��洢��
inst_ram inst_ram (
    .clka(clk),
    .ena(inst_ce),
    .wea(0), // дʹ��
    .addra({2'b0, pc[7:2]}), // �����ַ����Ѱַ����Ӧpc/4
    .dina(0),
    .douta(inst)
);

//������
controller controller(
    .inst(inst),
    .regdst(regdst),
    .regwrite(regwrite),
    .alusrc(alusrc),
    .memwrite(memwrite),
    .memtoreg(memtoreg),
    .branch(branch),
    .jump(jump),
    .alucontrol(alucontrol)
);
    
endmodule