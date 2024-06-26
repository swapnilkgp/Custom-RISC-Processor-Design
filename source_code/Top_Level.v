`timescale 1ns / 1ps

module TOPlevel(
    input clk
);
    wire loadPC;
    wire loadNPC;
    wire readIM;
    wire loadIR;
    wire readRegPort1;
    wire readRegPort2;
    wire loadA;
    wire loadB;
    wire loadIMM;
    wire loadIMM1;
    wire muxALU1;
    wire muxALU2;
    wire [3:0]ALUfunc;
    wire loadALUout;
    wire muxPC;
    wire readDM;
    wire writeDM;
    wire loadLMD;
    wire muxWB;
    wire writeReg;
    wire muxIMM;
    wire [1:0]muxREL;
    wire muxDM;
    wire muxRET;
    wire [31:0] IR;
    
    Processor P(
    loadPC,
    loadNPC,
    readIM,
    loadIR,
    readRegPort1,
    readRegPort2,
    loadA,
    loadB,
    loadIMM,
    loadIMM1,
    muxALU1,
    muxALU2,
    ALUfunc,
    loadALUout,
    muxPC,
    readDM,
    writeDM,
    loadLMD,
    muxWB,
    writeReg,
    muxIMM,
    muxREL,
    muxDM,
    muxRET,
    HALT,
    IR);
    ControlUnit CU(
        clk,
        IR,
        loadPC,
        loadNPC,
        readIM,
        loadIR,
        readRegPort1,
        readRegPort2,
        loadA,
        loadB,
        loadIMM,
        loadIMM1,
        muxALU1,
        muxALU2,
        ALUfunc,
        loadALUout,
        muxPC,
        readDM,
        writeDM,
        loadLMD,
        muxWB,
        writeReg,
        muxIMM,
        muxREL,
        muxDM,
        muxRET,
        HALT
    );
    // always @(*) begin
    //     $display("reg loadPC= %b",loadPC);                   
    //     $display("reg loadNPC= %d",loadNPC);                  
    //     $display("reg readIM= %d",readIM);                   
    //     $display("reg loadIR= %d",loadIR);                   
    //     $display("reg readRegPort1= %d",readRegPort1);                 
    //     $display("reg readRegPort2= %d",readRegPort2);                 
    //     $display("reg loadA= %d",loadA);                    
    //     $display("reg loadB= %d",loadB);                    
    //     $display("reg loadIMM= %d",loadIMM);                  
    //     $display("reg loadIMM1= %d",loadIMM1);                 
    //     $display("reg muxALU1= %d",muxALU1);                  
    //     $display("reg muxALU2= %d",muxALU2);                  
    //     $display("reg [3:0] ALUfunc= %d",ALUfunc);            
    //     $display("reg loadALUOut= %d",loadALUout);              
    //     $display("reg muxPC= %d",muxPC);              
    //     $display("reg readDM= %d",readDM);                   
    //     $display("reg writeDM= %d",writeDM);                  
    //     $display("reg loadLMD= %d",loadLMD);                  
    //     $display("reg muxWB= %d",muxWB);                    
    //     $display("reg writeReg= %d",writeReg);                 
    //     $display("reg muxIMM= %d",muxIMM);                   
    //     $display("reg [1:0] muxREL= %d",muxREL);             
    //     $display("reg muxDM= %d",muxDM);                    
    //     $display("reg muxRET= %d",muxRET);                   
    //     $display("reg halt= %d",HALT);
    //   end
endmodule
