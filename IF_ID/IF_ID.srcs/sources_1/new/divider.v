`timescale 1ns / 1ps
module divider(clk,rst,clk_out

    );
    input clk;
    input rst;
    output reg clk_out;
    reg [30:0]count;
    always @(posedge clk or posedge rst) begin
      if(rst)begin
        count<=0;
      end
      else if (count == 27'd49999999) begin // ���������ﵽָ��ֵʱ�����ü���������ת���ʱ���ź�
        count <= 0;
        clk_out <= ~clk_out;
      end 
      else begin
        count <= count + 1;
      end
    end
endmodule
