`timescale 1ns / 1ps

module DataMem(
    input [31:0] inport1,
    input readDM,
    input writeDM,
    output reg [31:0] R1,
    input [31:0] R3
);
    reg [31:0] R[255:0];
    
    initial begin
        R[4] = 32'd10;
    end
    
    always @(*) begin
        if(readDM == 1'b1)
        R1=R[inport1];
    end
    always @(*) begin
        if(writeDM == 1'b1)
        R[inport1]=R3;
    end
endmodule
