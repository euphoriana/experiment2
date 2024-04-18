`timescale 1ns / 1ps

module FinalTop(input clk,
                     input rst,
                     output regdst,
                     output regwrite,
                     output alusrc,
                     output memwrite,
                     output memtoreg,
                     output branch,
                     output jump,
                     output [2:0] alucontrol,
                     output wire [6:0] seg,    // 数码管显示指令
                     output wire [7:0] ans);
    
wire clk_out;
wire [31:0] inst;

divider divider(
    .clk(clk),
    .rst(rst),
    .clk_out(clk_out)
);

top top(
    .clk(clk_out),
    .rst(rst),
    .regdst(regdst),
    .regwrite(regwrite),
    .alusrc(alusrc),
    .memwrite(memwrite),
    .memtoreg(memtoreg),
    .branch(branch),
    .jump(jump),
    .alucontrol(alucontrol),
    .inst(inst)
);

display display(
    .clk(clk),
    .reset(rst),
    .s(inst),
    .seg(seg),
    .ans(ans)
);

endmodule
