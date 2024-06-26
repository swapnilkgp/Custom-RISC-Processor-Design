`timescale 1ns / 1ps

module Regbank(
    input [4:0] inport1,
    input [4:0] inport2,
    input readRegport1,
    input readRegport2,
    input writeReg,
    output reg [31:0] R1,
    output reg [31:0] R2,
    input [4:0] wport,
    input [31:0] R3
);
    
    reg [31:0] R[16:0];
    always @(*) begin
        R[0] = 32'd0;
    end
    
    initial begin
        R[0] = 32'd0;
        R[1] = 32'd2;
        R[2] = 32'd3;
        R[3] = 32'd3;
        R[4] = 32'd4;
        R[5] = 32'd5;
        R[6] = 32'd6;
        R[7] = 32'd7;
        R[8] = 32'd8;
        R[9] = 32'd9;
        R[10] = 32'd10;
        R[11] = 32'd11;
        R[12] = 32'd12;
        R[13] = 32'd13;
        R[14] = 32'd14;
        R[15] = 32'd15;
        R[16] = 32'd16;
    end
    
    
    always @(*) begin
        if(readRegport1 == 1'b1)
        R1=R[inport1];
    end
    always @(*) begin
        if(readRegport2 == 1'b1)
        R2=R[inport2];
    end
    always @(*) begin
        if(writeReg == 1'b1)
        R[wport]=R3;
    end
endmodule