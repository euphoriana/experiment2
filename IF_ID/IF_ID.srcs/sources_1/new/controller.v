`timescale 1ns / 1ps

module controller(input [31:0] inst,
                  output regdst,
                  output regwrite,
                  output alusrc,
                  output memwrite,
                  output memtoreg,
                  output branch,
                  output jump,
                  output [2:0]alucontrol);

wire [1:0]aluop;
maindec maindec(
    .op(inst[31:26]),
    .regdst(regdst),
    .regwrite(regwrite),
    .alusrc(alusrc),
    .memwrite(memwrite),
    .memtoreg(memtoreg),
    .branch(branch),
    .jump(jump),
    .aluop(aluop)
);

aludec aludec(
    .funct(inst[5:0]),
    .aluop(aluop),
    .alucontrol(alucontrol)
);

endmodule
