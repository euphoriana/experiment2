module pc_add(pc,offset,pc_next

    );
    input [7:0]pc;
    input [7:0]offset;
    output [7:0]pc_next;
    assign pc_next=pc+offset;
endmodule
