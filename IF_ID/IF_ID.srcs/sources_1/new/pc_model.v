module pc_model(clk,rst,pc,inst_ce,d
    );
    input clk;
    input rst;
    input [7:0]d;
    output reg inst_ce;
    output reg [7:0]pc;
    always@(posedge clk or posedge rst)begin
     if(rst)begin
       pc<=-4;
       inst_ce<=1'b0;
     end
     else begin
       pc<=d;
       inst_ce<=1'b1;
     end
    end
endmodule