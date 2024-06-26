Design a 32-bit RISC-like processor in Verilog with the following specifications:

● Sixteen 32-bit general-purpose registers R0..R15, organized as a register bank with two read ports
and one write port.
● R0 is a special read-only register that is assumed to contain the fixed value of 0.
● Memory is byte addressable with a 32-bit memory address. For simplicity, in this design we shall
assume that all operations are on 32-bit data, and all loads and stores occur from memory addresses
that are multiples of 4.
● A 32-bit program counter PC
● A 32-bit stack pointer SP
● Addressing modes to be supported:
a) Register addressing
b) Immediate addressing
c) Base addressing for accessing memory (with any of the registers used as base register)
d) PC relative addressing for branch
e) SP relative addressing
● The following instruction set has to be implemented:
a) Arithmetic and logic instructions: ADD, SUB, AND, OR, XOR, NOT, SLA, SRA, SRL.
There are corresponding immediate addressing versions with a suffixing “I” (like ADDI,
SUBI, etc.). Assume that all shift instructions can have either 0 (no shift) or 1 (1-bit shift) as
operand. Some example uses are as follows:
ADDI R3,#25 // R3 <= R3 + 25
ADDI R5,#-1 // R5 <= R5 - 1
ADD R1,R2,R3 // R1 <= R2 + R3
SLA R5,R7 // R5 <= R5 << R7[0]
SLAI R5,#1 // R5 <= R5 << 1
SUBI SP,#64 // SP <= SP - 64
b) Load and store instructions: LD, ST, LDSP, STSP (all load and stores are 32-bits) and use
register indexed addressing (any of the registers R1..R15 or SP can be used). Some example
uses are as follows:
LD R2,10(R6) // R2 <= Mem[R6+10]
ST R2,-2(R11) // Mem[R11-2] <= R2
LDSP SP,0(R2) // SP <= Mem[R2+0]
STSP SP,100(R7) // Mem[R7+100] <= SP
c) Branch instructions: BR, BMI, BPL, BZ. Some example uses are as follows:
BR #10 // PC <= PC + 10
BMI R5,#-10 // PC <= PC - 10 if (R5 < 0)
BPL R5,#30 // PC <= PC + 30 if (R5 > 0)
BZ R8,#-75 // PC <= PC - 75 if (R8 = 0)
d) Stack instructions: PUSH, POP, CALL, RET. Any registers R1..R15 can be used for PUSH
and POP. Some example uses are as follows:
PUSH R6 // Push R6 in the stack
POP R10 // Pop from stack and store in R10
CALL #1000 // SP <= SP – 4; Mem[SP] <= PC + 4;
PC <= PC + 1000
RET // PC = Mem[PC]; SP <= SP + 4
e) Register to register transfer: MOVE. Some example uses are as follows:
MOVE R10,R5 // R10 = R5
MOVE R2,R0 // R2 = R0
MOVE R7,SP // R7 = SP
f) Program control: HALT, NOP. The HALT instruction waits for an interrupt on an input pin
“INT”. NOP is a dummy instruction that performs no operation.
