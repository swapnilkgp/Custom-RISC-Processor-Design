`timescale 1ns / 1ps

module MUX(
    input [31:0] in1,
    input [31:0] in2,
    input sel,
    output [31:0] result
);
    assign result = (sel)?(in2):(in1);
//    assign result = (in1 && (~sel)) || (in2 && sel);
endmodule

module MUX_1_Bit(
    input in1,
    input in2,
    input sel,
    output result
);
    assign result = (sel)?(in2):(in1);
//    assign result = (in1 && (~sel)) || (in2 && sel);
endmodule

module MUX2to4(
    input in0,
    input in1,
    input in2,
    input in3,
    input [1:0] sel,
    output result
);
    wire w1,w2;
    MUX_1_Bit M1(in0,in1,sel[0],w1);
    MUX_1_Bit M2(in2,in3,sel[0],w2);
    MUX_1_Bit M3(w1,w2,sel[1],result);
endmodule


module Processor(
    input loadPC,
    input loadNPC,
    input readIM,
    input loadIR,
    input readRegPort1,
    input readRegPort2,
    input loadA,
    input loadB,
    input loadIMM,
    input loadIMM1,
    input muxALU1,
    input muxALU2,
    input [3:0]ALUfunc,
    input loadALUout,
    input muxPC,
    input readDM,
    input writeDM,
    input loadLMD,
    input muxWB,
    input writeReg,
    input muxIMM,
    input [1:0]muxREL,
    input muxDM,
    input muxRET,
    input HALT,
    output reg [31:0] IR
);
    reg [31:0] PC,NPC,A,B,IMM,IMM1,ALUOUT,LMD;
    reg [4:0]rt;
    wire [31:0] wIR,wA,wB,wR3,wALU1,wALU2,wALUout,wdatamem,wLMD,wul2,wPC,wALU3;
    wire wul,wul1;
    InstructionMem I(PC,readIM,wIR);
    initial begin
    PC = 32'd0;
    end
    always @(*) begin
        if(loadIR == 1'b1) IR=wIR;
    end
    always @(*) begin
        if(IR[31:29] == 3'b000) begin
            if(IR[4:0] == 5'b00000 || IR[4:0] == 5'b00010 || IR[4:0] == 5'b00100 || IR[4:0] == 5'b00110 || IR[4:0] == 5'b01000 || IR[4:0] == 5'b01011 || IR[4:0] == 5'b01101 || IR[4:0] == 5'b01111) begin
                rt = IR[18:14];
            end
            else rt = IR[28:24];
        end
        else rt = IR[28:24];
    end
    Regbank R(IR[28:24],IR[23:19],readRegPort1,readRegPort2,writeReg,wA,wB,rt,wR3);
    always @(*) begin
    if(loadA == 1'b1)begin
        A=wA;
    end
    end
    always @(*) begin 
        if(loadB == 1'b1) B=wB;
    end
    always @(*) begin
        if(loadIMM == 1'b1) begin
            if(IR[31:29] == 3'b001)begin
                if(IR[18]==1'b0) IMM={18'b000000000000000000,IR[18:5]};
                else IMM={18'b111111111111111111,IR[18:5]};
            end
            else begin
                if(IR[20]==1'b0) IMM={16'b0000000000000000,IR[20:5]};
                else IMM={16'b1111111111111111,IR[20:5]};
            end
        end
    end
    always @(*) begin
        if(loadIMM1 == 1'b1) begin
            if(IR[25]==1'b0) IMM1={6'b000000,IR[25:0]};
             else IMM1={6'b111111,IR[25:0]};
        end
    end
    
    MUX M7(A,NPC,muxALU1,wALU1);
    MUX M5(IMM,IMM1,muxIMM,wALU3);
    MUX M6(B,wALU3,muxALU2,wALU2);
    
    ALU_module ouralu(wALU1,wALU2,ALUfunc,wALUout);
    always @(*) begin
        if(loadALUout == 1'b1) ALUOUT=wALUout;
    end
    MUX M4(B,NPC,muxDM,wdatamem);
    DataMem D(ALUOUT,readDM,writeDM,wLMD,wdatamem);
    always @(*) begin
        if(loadLMD == 1'b1) LMD=wLMD;
    end
    wire zr,gt,sm,dummy;
    assign zr = ~| A;
    assign gt = ~A[31] && ~zr;
    assign sm = A[31];
    assign dummy = 1'b1;
    MUX2to4 M10(zr,gt,sm,dummy,muxREL,wul);    
    assign wul1=wul && muxPC;
    MUX M2(NPC,ALUOUT,wul1,wul2);
    MUX M3(wul2,LMD,muxRET,wPC);
    MUX M1(LMD,ALUOUT,muxWB,wR3);
    always @(*) begin
     if(loadPC == 1'b1) PC=wPC;
    end
    always @(*) begin
        if(loadNPC == 1'b1) begin
            NPC=PC+1;
            // $display("PC = %d\n",PC);
            // $display("NPC = %d\n",NPC);
        end
     end
    // always @(*)begin
    //     // $display("*******ALUOUT = %d\n",ALUOUT);
    //     // $display("*******IMM : %d\n",IMM);
    //     // $display("*******alufunc: %d\n",ALUfunc);
    //     // $display("wALU1 : %d\n",wALU1);
    //     // $display("wALU2 : %d\n",wALU2);
    //     // $display("wALU3 : %d\n",wALU3);
    //     // $display("wALUout: %d\n",wALUout);
    // end
    //  always @(*) begin
    //     $display("IR = %32b\n",IR);
    //     $display("A : %d\n",A);
    //     $display("NPC : %d\n",NPC);
    //     $display("B : %d\n",B);
    //     $display("IMM : %d\n",IMM);
    //     $display("wALU1 : %d\n",wALU1);
    //     $display("wALU2 : %d\n",wALU2);
    //     $display("wALU3 : %d\n",wALU3);
    //  end
    always @(*) begin
        $display("IR = %32b\n",IR);
    end
     
     always @(*)begin
        $display("R1 = %d, R2 = %d, R3 = %32b, R4 = %32b, R5 = %d R6 = %d, R7 = %d R8 = %d\n", R.R[1], R.R[2], R.R[3], R.R[4], R.R[5], R.R[6], R.R[7], R.R[8]);
     end
//     always @(*)begin
//        $display("reg loadPC= %b",loadPC);                   
//        $display("reg loadNPC= %d",loadNPC);                  
//        $display("reg readIM= %d",readIM);                   
//        $display("reg loadIR= %d",loadIR);                   
//        $display("reg readRegPort1= %d",readRegport1);                 
//        $display("reg readRegPort2= %d",readRegport2);                 
//        $display("reg loadA= %d",loadA);                    
//        $display("reg loadB= %d",loadB);                    
//        $display("reg loadIMM= %d",loadIMM);                  
//        $display("reg loadIMM1= %d",loadIMM1);                 
//        $display("reg muxALU1= %d",muxALU1);                  
//        $display("reg muxALU2= %d",muxALU2);                  
//        $display("reg [3:0] ALUfunc= %d",ALUfunc);            
//        $display("reg loadALUOut= %d",loadALUout);              
//        $display("reg muxPC= %d",muxPC);              
//        $display("reg readDM= %d",readDM);                   
//        $display("reg writeDM= %d",writeDM);                  
//        $display("reg loadLMD= %d",loadLMD);                  
//        $display("reg muxWB= %d",muxWB);                    
//        $display("reg writeReg= %d",writeReg);                 
//        $display("reg muxIMM= %d",muxIMM);                   
//        $display("reg [1:0] muxREL= %d",muxREL);             
//        $display("reg muxDM= %d",muxDM);                    
//        $display("reg muxRET= %d",muxRET);                   
//        $display("reg halt= %d",HALT); 
//     end
//    always @(posedge loadNPC)
//    begin
//        $display("R1 = %d, R2 = %d, R3 = %d, R4 = %d, R5 = %d \n", R.R[1], R.R[2], R.R[3], R.R[4], R.R[5]);
//    end
endmodule

