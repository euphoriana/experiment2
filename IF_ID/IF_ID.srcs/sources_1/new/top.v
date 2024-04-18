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

// pc与加法器
// pc 存的是byte，32bit(4Byte)的地址对应pc是4位，每次加4个byte
wire [7:0] pc;
wire [7:0] pc_next; // 下一个周期的pc值
wire inst_ce; // 接指令存储器的使能开关

pc_add pc_add(pc,8'h04,pc_next);
//assign pc_next=pc+8'h04;

pc_model pc_model(
    .clk(clk),
    .rst(rst),
    .d(pc_next),
    .pc(pc),
    .inst_ce(inst_ce)
);

//指令存储器
inst_ram inst_ram (
    .clka(clk),
    .ena(inst_ce),
    .wea(0), // 写使能
    .addra({2'b0, pc[7:2]}), // 输入地址按字寻址，对应pc/4
    .dina(0),
    .douta(inst)
);

//控制器
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