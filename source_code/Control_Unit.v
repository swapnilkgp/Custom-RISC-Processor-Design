`timescale 1ns / 1ps

module ControlUnit(
    input        clk,
    input        [31:0] instr,                                           
    output reg   loadPC,                                           
    output reg   loadNPC,                                           
    output reg   readIM,                                           
    output reg   loadIR,                                           
    output reg   readRegPort1,                                           
    output reg   readRegPort2,                                           
    output reg   loadA,                                           
    output reg   loadB,                                           
    output reg   loadIMM,                                           
    output reg   loadIMM1,                                           
    output reg   muxALU1,                                           
    output reg   muxALU2,                                           
    output reg   [3:0] ALUfunc,                                           
    output reg   loadALUOut,  
    output reg   muxPC,                                         
    output reg   readDM,                                           
    output reg   writeDM,                                           
    output reg   loadLMD,                                           
    output reg   muxWB,                                           
    output reg   writeReg,                                           
    output reg   muxIMM,                                           
    output reg   [1:0] muxREL,                                           
    output reg   muxDM,                                           
    output reg   muxRET,                                           
    output reg   HALT                                           
);
    reg [2:0] time_step;
    initial begin
        time_step = 3'b000;
    end                                      
    always @(clk)
    begin
    //   $display("Time : %d",time_step);
    if (time_step == 3'b000) begin
        loadPC = 1'b0;
        loadNPC = 1'b1;
        readIM = 1'b1;
        loadIR = 1'b1;
        readRegPort1 = 1'b0;
        readRegPort2 = 1'b0;
        loadA = 1'b0;
        loadB = 1'b0;
        loadIMM = 1'b0;
        loadIMM1 = 1'b0;
        muxALU1 = 1'b0;
        muxALU2 = 1'b0;
        ALUfunc = 4'b0000;
        loadALUOut = 1'b0;
		muxPC = 1'b0;
        readDM = 1'b0;
        writeDM = 1'b0;
        loadLMD = 1'b0;
        muxWB = 1'b0;
        writeReg = 1'b0;
        muxIMM = 1'b0;
        muxREL = 2'b00;
        muxDM = 1'b0;
        muxRET = 1'b0;
        HALT = 1'b0;
    end
    case (instr[31:29])
    // --------------------------------------------- ALU operations ----------------------------------------------------
        3'd0:
        begin
            case(instr[4:0])
                // ADD
                5'b00000:
                begin
                    case(time_step)
                        3'b000:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b1;
                            readIM = 1'b1;
                            loadIR = 1'b1;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b001:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b1;
                            readRegPort2 = 1'b1;
                            loadA = 1'b1;
                            loadB = 1'b1;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b010:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b1;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b011:
                        begin
                            loadPC = 1'b1;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b100:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b1;
                            writeReg = 1'b1;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                    endcase
                end
                // ADDI
                5'b00001:
                begin
                    case(time_step)
                        3'b000:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b1;
                            readIM = 1'b1;
                            loadIR = 1'b1;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b001:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b1;
                            readRegPort2 = 1'b0;
                            loadA = 1'b1;
                            loadB = 1'b0;
                            loadIMM = 1'b1;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b010:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b1;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b1;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b011:
                        begin
                            loadPC = 1'b1;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b100:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b1;
                            writeReg = 1'b1;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                    endcase
                end
                // SUB
                5'b00010:
                begin
                    case(time_step)
                        3'b000:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b1;
                            readIM = 1'b1;
                            loadIR = 1'b1;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b001:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b1;
                            readRegPort2 = 1'b1;
                            loadA = 1'b1;
                            loadB = 1'b1;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b010:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0001;
                            loadALUOut = 1'b1;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b011:
                        begin
                            loadPC = 1'b1;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b1;
                            writeDM = 1'b0;
                            loadLMD = 1'b1;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b100:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b1;
                            writeReg = 1'b1;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                    endcase
                end 
                // SUBI 
                5'b00011:
                begin
                    case(time_step)
                        3'b000:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b1;
                            readIM = 1'b1;
                            loadIR = 1'b1;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b001:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b1;
                            readRegPort2 = 1'b0;
                            loadA = 1'b1;
                            loadB = 1'b0;
                            loadIMM = 1'b1;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b010:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b1;
                            ALUfunc = 4'b0001;
                            loadALUOut = 1'b1;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b011:
                        begin
                            loadPC = 1'b1;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b100:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b1;
                            writeReg = 1'b1;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                    endcase
                end
                // AND                
                5'b00100: 
                begin
                    case(time_step)
                        3'b000:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b1;
                            readIM = 1'b1;
                            loadIR = 1'b1;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b001:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b1;
                            readRegPort2 = 1'b1;
                            loadA = 1'b1;
                            loadB = 1'b1;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b010:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0010;
                            loadALUOut = 1'b1;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b011:
                        begin
                            loadPC = 1'b1;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b1;
                            writeDM = 1'b0;
                            loadLMD = 1'b1;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b100:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b1;
                            writeReg = 1'b1;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                    endcase
                end
                // ANDI
                5'b00101: 
                begin
                    case(time_step)
                        3'b000:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b1;
                            readIM = 1'b1;
                            loadIR = 1'b1;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b001:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b1;
                            readRegPort2 = 1'b0;
                            loadA = 1'b1;
                            loadB = 1'b0;
                            loadIMM = 1'b1;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b010:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b1;
                            ALUfunc = 4'b0010;
                            loadALUOut = 1'b1;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b011:
                        begin
                            loadPC = 1'b1;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b100:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b1;
                            writeReg = 1'b1;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                    endcase
                end
                // OR
                5'b00110: 
                begin
                    case(time_step)
                        3'b000:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b1;
                            readIM = 1'b1;
                            loadIR = 1'b1;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b001:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b1;
                            readRegPort2 = 1'b1;
                            loadA = 1'b1;
                            loadB = 1'b1;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b010:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0011;
                            loadALUOut = 1'b1;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b011:
                        begin
                            loadPC = 1'b1;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b1;
                            writeDM = 1'b0;
                            loadLMD = 1'b1;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b100:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b1;
                            writeReg = 1'b1;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                    endcase
                end
                // ORI
                5'b00111:
                begin
                    case(time_step)
                        3'b000:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b1;
                            readIM = 1'b1;
                            loadIR = 1'b1;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b001:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b1;
                            readRegPort2 = 1'b0;
                            loadA = 1'b1;
                            loadB = 1'b0;
                            loadIMM = 1'b1;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b010:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b1;
                            ALUfunc = 4'b0011;
                            loadALUOut = 1'b1;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b011:
                        begin
                            loadPC = 1'b1;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b100:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b1;
                            writeReg = 1'b1;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                    endcase
                end
                // XOR    
                5'b01000:
                begin
                    case(time_step)
                        3'b000:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b1;
                            readIM = 1'b1;
                            loadIR = 1'b1;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b001:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b1;
                            readRegPort2 = 1'b1;
                            loadA = 1'b1;
                            loadB = 1'b1;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b010:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0100;
                            loadALUOut = 1'b1;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b011:
                        begin
                            loadPC = 1'b1;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b1;
                            writeDM = 1'b0;
                            loadLMD = 1'b1;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b100:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b1;
                            writeReg = 1'b1;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                    endcase
                end 
                // XORI 
                5'b01001:
                begin
                    case(time_step)
                        3'b000:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b1;
                            readIM = 1'b1;
                            loadIR = 1'b1;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b001:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b1;
                            readRegPort2 = 1'b0;
                            loadA = 1'b1;
                            loadB = 1'b0;
                            loadIMM = 1'b1;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b010:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b1;
                            ALUfunc = 4'b0100;
                            loadALUOut = 1'b1;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b011:
                        begin
                            loadPC = 1'b1;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b100:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b1;
                            writeReg = 1'b1;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                    endcase
                end  
                // NOT
                5'b01010:
                begin
                    case(time_step)
                        3'b000:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b1;
                            readIM = 1'b1;
                            loadIR = 1'b1;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b001:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b1;
                            readRegPort2 = 1'b1;
                            loadA = 1'b1;
                            loadB = 1'b1;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b010:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0101;
                            loadALUOut = 1'b1;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b011:
                        begin
                            loadPC = 1'b1;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b100:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b1;
                            writeReg = 1'b1;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                    endcase
                end  
                // SLA
                5'b01011:
                begin
                    case(time_step)
                        3'b000:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b1;
                            readIM = 1'b1;
                            loadIR = 1'b1;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b001:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b1;
                            readRegPort2 = 1'b1;
                            loadA = 1'b1;
                            loadB = 1'b1;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b010:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0110;
                            loadALUOut = 1'b1;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b011:
                        begin
                            loadPC = 1'b1;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b100:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b1;
                            writeReg = 1'b1;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                    endcase
                end  
                // SLAI
                5'b01100: 
                begin
                    case(time_step)
                        3'b000:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b1;
                            readIM = 1'b1;
                            loadIR = 1'b1;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b001:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b1;
                            readRegPort2 = 1'b0;
                            loadA = 1'b1;
                            loadB = 1'b0;
                            loadIMM = 1'b1;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b010:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b1;
                            ALUfunc = 4'b0110;
                            loadALUOut = 1'b1;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b011:
                        begin
                            loadPC = 1'b1;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b100:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b1;
                            writeReg = 1'b1;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                    endcase
                end
                // SRA
                5'b01101:
                begin
                    case(time_step)
                        3'b000:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b1;
                            readIM = 1'b1;
                            loadIR = 1'b1;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b001:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b1;
                            readRegPort2 = 1'b1;
                            loadA = 1'b1;
                            loadB = 1'b1;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b010:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0111;
                            loadALUOut = 1'b1;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b011:
                        begin
                            loadPC = 1'b1;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b100:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b1;
                            writeReg = 1'b1;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                    endcase
                end
                // SRAI
                5'b01110:
                begin
                    case(time_step)
                        3'b000:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b1;
                            readIM = 1'b1;
                            loadIR = 1'b1;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b001:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b1;
                            readRegPort2 = 1'b0;
                            loadA = 1'b1;
                            loadB = 1'b0;
                            loadIMM = 1'b1;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b010:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b1;
                            ALUfunc = 4'b0111;
                            loadALUOut = 1'b1;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b011:
                        begin
                            loadPC = 1'b1;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b100:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b1;
                            writeReg = 1'b1;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                    endcase
                end  
                // SRL
                5'b01111:
                begin
                    case(time_step)
                        3'b000:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b1;
                            readIM = 1'b1;
                            loadIR = 1'b1;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b001:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b1;
                            readRegPort2 = 1'b1;
                            loadA = 1'b1;
                            loadB = 1'b1;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b010:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b1000;
                            loadALUOut = 1'b1;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b011:
                        begin
                            loadPC = 1'b1;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b100:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b1;
                            writeReg = 1'b1;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                    endcase
                end
                // SRLI
                5'b10000:
                begin
                    case(time_step)
                        3'b000:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b1;
                            readIM = 1'b1;
                            loadIR = 1'b1;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b001:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b1;
                            readRegPort2 = 1'b0;
                            loadA = 1'b1;
                            loadB = 1'b0;
                            loadIMM = 1'b1;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b010:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b1;
                            ALUfunc = 4'b1000;
                            loadALUOut = 1'b1;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b011:
                        begin
                            loadPC = 1'b1;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b0;
                            writeReg = 1'b0;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                        3'b100:
                        begin
                            loadPC = 1'b0;
                            loadNPC = 1'b0;
                            readIM = 1'b0;
                            loadIR = 1'b0;
                            readRegPort1 = 1'b0;
                            readRegPort2 = 1'b0;
                            loadA = 1'b0;
                            loadB = 1'b0;
                            loadIMM = 1'b0;
                            loadIMM1 = 1'b0;
                            muxALU1 = 1'b0;
                            muxALU2 = 1'b0;
                            ALUfunc = 4'b0000;
                            loadALUOut = 1'b0;
							muxPC = 1'b0;
                            readDM = 1'b0;
                            writeDM = 1'b0;
                            loadLMD = 1'b0;
                            muxWB = 1'b1;
                            writeReg = 1'b1;
                            muxIMM = 1'b0;
                            muxREL = 2'b00;
                            muxDM = 1'b0;
                            muxRET = 1'b0;
                            HALT = 1'b0;
                        end
                    endcase
                end

            endcase
        end
        //------------------------------- Load and Store Operations --------------------------------------

    3'd5:
    begin
        case(instr[4:0])
        5'b00000:
        //  HALT
        begin
            case (time_step)
                3'b000:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b1;
                    readIM = 1'b1;
                    loadIR = 1'b1;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b001:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
					muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
                end
                3'b010:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
					muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b1;
                end
                3'b010:
                begin
                    loadPC = 1'b1;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
					muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b1;
                end
                3'b100:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b1;
                end
            endcase
        end
        5'b00001:
        begin
            // NOP
            case (time_step)
                3'b000:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b1;
                    readIM = 1'b1;
                    loadIR = 1'b1;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b001:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b010:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b011:
                begin
                    loadPC = 1'b1;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b100:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
            endcase
        end
        endcase
    end
    //------------------------- Register to Register Transfer ---------------------------------
    3'd4:
    begin
        case (time_step)
                3'b000:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b1;
                    readIM = 1'b1;
                    loadIR = 1'b1;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b001:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b1;
                    readRegPort2 = 1'b1;
                    loadA = 1'b1;
                    loadB = 1'b1;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b010:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b1;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b011:
                begin
                    loadPC = 1'b1;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b100:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b1;
                    writeReg = 1'b1;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
            endcase
    end
    //------------------------------- Branch Instructions --------------------------
    //BR
    3'd6:
    begin
        case (time_step)
            3'b000:
            begin
                loadPC = 1'b0;
                loadNPC = 1'b1;
                readIM = 1'b1;
                loadIR = 1'b1;
                readRegPort1 = 1'b0;
                readRegPort2 = 1'b0;
                loadA = 1'b0;
                loadB = 1'b0;
                loadIMM = 1'b0;
                loadIMM1 = 1'b0;
                muxALU1 = 1'b0;
                muxALU2 = 1'b0;
                ALUfunc = 4'b0000;
                loadALUOut = 1'b0;
                muxPC = 1'b0;
                readDM = 1'b0;
                writeDM = 1'b0;
                loadLMD = 1'b0;
                muxWB = 1'b0;
                writeReg = 1'b0;
                muxIMM = 1'b0;
                muxREL = 2'b00;
                muxDM = 1'b0;
                muxRET = 1'b0;
                HALT = 1'b0;
            end
            3'b001:
            begin
                loadPC = 1'b0;
                loadNPC = 1'b0;
                readIM = 1'b0;
                loadIR = 1'b0;
                readRegPort1 = 1'b0;
                readRegPort2 = 1'b0;
                loadA = 1'b0;
                loadB = 1'b0;
                loadIMM = 1'b0;
                loadIMM1 = 1'b1;
                muxALU1 = 1'b0;
                muxALU2 = 1'b0;
                ALUfunc = 4'b0000;
                loadALUOut = 1'b0;
                muxPC = 1'b1;
                readDM = 1'b0;
                writeDM = 1'b0;
                loadLMD = 1'b0;
                muxWB = 1'b0;
                writeReg = 1'b0;
                muxIMM = 1'b0;
                muxREL = 2'b11;
                muxDM = 1'b0;
                muxRET = 1'b0;
                HALT = 1'b0;
            end
            3'b010:
            begin
                loadPC = 1'b0;
                loadNPC = 1'b0;
                readIM = 1'b0;
                loadIR = 1'b0;
                readRegPort1 = 1'b0;
                readRegPort2 = 1'b0;
                loadA = 1'b0;
                loadB = 1'b0;
                loadIMM = 1'b0;
                loadIMM1 = 1'b0;
                muxALU1 = 1'b1;
                muxALU2 = 1'b1;
                ALUfunc = 4'b0000;
                loadALUOut = 1'b1;
                muxPC = 1'b1;
                readDM = 1'b0;
                writeDM = 1'b0;
                loadLMD = 1'b0;
                muxWB = 1'b0;
                writeReg = 1'b0;
                muxIMM = 1'b1;
                muxREL = 2'b11;
                muxDM = 1'b0;
                muxRET = 1'b0;
                HALT = 1'b0;
            end
            3'b011:
            begin
                loadPC = 1'b1;
                loadNPC = 1'b0;
                readIM = 1'b0;
                loadIR = 1'b0;
                readRegPort1 = 1'b0;
                readRegPort2 = 1'b0;
                loadA = 1'b0;
                loadB = 1'b0;
                loadIMM = 1'b0;
                loadIMM1 = 1'b0;
                muxALU1 = 1'b0;
                muxALU2 = 1'b0;
                ALUfunc = 4'b0000;
                loadALUOut = 1'b0;
                muxPC = 1'b1;
                readDM = 1'b0;
                writeDM = 1'b0;
                loadLMD = 1'b0;
                muxWB = 1'b0;
                writeReg = 1'b0;
                muxIMM = 1'b0;
                muxREL = 2'b11;
                muxDM = 1'b0;
                muxRET = 1'b0;
                HALT = 1'b0;
            end
            3'b100:
            begin
                loadPC = 1'b0;
                loadNPC = 1'b0;
                readIM = 1'b0;
                loadIR = 1'b0;
                readRegPort1 = 1'b0;
                readRegPort2 = 1'b0;
                loadA = 1'b0;
                loadB = 1'b0;
                loadIMM = 1'b0;
                loadIMM1 = 1'b0;
                muxALU1 = 1'b0;
                muxALU2 = 1'b0;
                ALUfunc = 4'b0000;
                loadALUOut = 1'b0;
                muxPC = 1'b1;
                readDM = 1'b0;
                writeDM = 1'b0;
                loadLMD = 1'b0;
                muxWB = 1'b0;
                writeReg = 1'b0;
                muxIMM = 1'b0;
                muxREL = 2'b11;
                muxDM = 1'b0;
                muxRET = 1'b0;
                HALT = 1'b0;
            end
        endcase        
    end
    3'd2:
    begin
        case (instr[4:0])
            // BMI
            5'b00001:
            begin
                case (time_step)
                3'b000:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b1;
                    readIM = 1'b1;
                    loadIR = 1'b1;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b001:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b1;
                    readRegPort2 = 1'b0;
                    loadA = 1'b1;
                    loadB = 1'b0;
                    loadIMM = 1'b1;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b1;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b10;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b010:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b1;
                    muxALU2 = 1'b1;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b1;
                    muxPC = 1'b1;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b10;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b011:
                begin
                    loadPC = 1'b1;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b1;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b10;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b100:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b1;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b10;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
            endcase
            end
            // BPL
            5'b00010:
            begin
            case (time_step)
                3'b000:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b1;
                    readIM = 1'b1;
                    loadIR = 1'b1;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b001:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b1;
                    readRegPort2 = 1'b0;
                    loadA = 1'b1;
                    loadB = 1'b0;
                    loadIMM = 1'b1;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b1;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b01;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b010:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b1;
                    muxALU2 = 1'b1;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b1;

                    muxPC = 1'b1;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b01;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b011:
                begin
                    loadPC = 1'b1;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;

                    muxPC = 1'b1;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b01;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b100:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b1;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b01;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
            endcase
            end
            // BZ
            5'b00011:
            begin
            case (time_step)
                3'b000:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b1;
                    readIM = 1'b1;
                    loadIR = 1'b1;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b001:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b1;
                    readRegPort2 = 1'b0;
                    loadA = 1'b1;
                    loadB = 1'b0;
                    loadIMM = 1'b1;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b1;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b010:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b1;
                    muxALU2 = 1'b1;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b1;
                    muxPC = 1'b1;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b011:
                begin
                    loadPC = 1'b1;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b1;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b100:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b1;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
            endcase
            end
        endcase
    end
    //--------------------------- Load and Store Instructions -----------------------------
    3'b001:
    begin
        case (instr[4:0])
            // LD
            5'b00000:
            begin
                case (time_step)
                3'b000:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b1;
                    readIM = 1'b1;
                    loadIR = 1'b1;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b001:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b1;
                    readRegPort2 = 1'b0;
                    loadA = 1'b1;
                    loadB = 1'b0;
                    loadIMM = 1'b1;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b010:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b1;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b1;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b011:
                begin
                    loadPC = 1'b1;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b1;
                    writeDM = 1'b0;
                    loadLMD = 1'b1;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b100:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b1;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
            endcase
            end
            // ST
            5'b00001:
            begin
                case (time_step)
                3'b000:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b1;
                    readIM = 1'b1;
                    loadIR = 1'b1;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b001:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b1;
                    readRegPort2 = 1'b1;
                    loadA = 1'b1;
                    loadB = 1'b1;
                    loadIMM = 1'b1;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b010:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b1;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b1;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b011:
                begin
                    loadPC = 1'b1;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b1;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b100:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
            endcase
            end
            // LDSP
            5'b00010:
            begin
                case (time_step)
                3'b000:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b1;
                    readIM = 1'b1;
                    loadIR = 1'b1;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b001:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b1;
                    readRegPort2 = 1'b0;
                    loadA = 1'b1;
                    loadB = 1'b0;
                    loadIMM = 1'b1;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b010:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b1;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b1;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b011:
                begin
                    loadPC = 1'b1;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b1;
                    writeDM = 1'b0;
                    loadLMD = 1'b1;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b100:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b1;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
            endcase
            end
            // STSP
            5'b00011:
            begin
                case (time_step)
                3'b000:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b1;
                    readIM = 1'b1;
                    loadIR = 1'b1;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b001:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b1;
                    readRegPort2 = 1'b1;
                    loadA = 1'b1;
                    loadB = 1'b1;
                    loadIMM = 1'b1;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b010:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b1;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b1;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b011:
                begin
                    loadPC = 1'b1;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b1;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
                3'b100:
                begin
                    loadPC = 1'b0;
                    loadNPC = 1'b0;
                    readIM = 1'b0;
                    loadIR = 1'b0;
                    readRegPort1 = 1'b0;
                    readRegPort2 = 1'b0;
                    loadA = 1'b0;
                    loadB = 1'b0;
                    loadIMM = 1'b0;
                    loadIMM1 = 1'b0;
                    muxALU1 = 1'b0;
                    muxALU2 = 1'b0;
                    ALUfunc = 4'b0000;
                    loadALUOut = 1'b0;
                    muxPC = 1'b0;
                    readDM = 1'b0;
                    writeDM = 1'b0;
                    loadLMD = 1'b0;
                    muxWB = 1'b0;
                    writeReg = 1'b0;
                    muxIMM = 1'b0;
                    muxREL = 2'b00;
                    muxDM = 1'b0;
                    muxRET = 1'b0;
					HALT = 1'b0;
                end
            endcase
            end
        endcase

    end
    endcase //************************************************
    time_step=(time_step+1)%5;
//     $display($time, "  Time : %d",time_step);
//    $display("reg loadPC= %b",loadPC);                   
//        $display("reg loadNPC= %d",loadNPC);                  
//        $display("reg readIM= %d",readIM);                   
//        $display("reg loadIR= %d",loadIR);                   
//        $display("reg readRegPort1= %d",readRegPort1);                 
//        $display("reg readRegPort2= %d",readRegPort2);                 
//        $display("reg loadA= %d",loadA);                    
//        $display("reg loadB= %d",loadB);                    
//        $display("reg loadIMM= %d",loadIMM);                  
//        $display("reg loadIMM1= %d",loadIMM1);                 
//        $display("reg muxALU1= %d",muxALU1);                  
//        $display("reg muxALU2= %d",muxALU2);                  
//        $display("reg [3:0] ALUfunc= %d",ALUfunc);            
//        $display("reg loadALUOut= %d",loadALUOut);              
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
    end

endmodule
