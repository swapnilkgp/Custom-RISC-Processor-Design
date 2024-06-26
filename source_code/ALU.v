`timescale 1ns / 1ps

// // Assignment of result from in1

// // 1's complement of in1
// module NOT(in1,result);
// input [31:0] in1;
// output [31:0] result;
// assign result=~in1;
// endmodule

// // Shift right
// module SRA(in1,result);
// input [31:0] in1;
// output [31:0] result;
// assign result=in1>>>1;
// endmodule

// module SRL(in1,result);
// input [31:0] in1;
// output [31:0] result;
// assign result=in1>>1;
// endmodule

// // Shift left
// module SLA(in1,result);
// input [31:0] in1;
// output [31:0] result;
// assign result=in1<<<1;
// endmodule

// // Binary and
// module AND(in1,in2,result);
// input [31:0] in1;
// input [31:0] in2;
// output [31:0] result;
// assign result= in1&in2;
// // always @(*)begin
// //     // $display("in1: %d",in1);
// //     // $display("in2: %d",in2);
// //     // $display("result: %d",result);
// // end
// endmodule

// // Binary or
// module OR(in1,in2,result);
// input [31:0] in1;
// input [31:0] in2;
// output [31:0] result;
// assign result= in1|in2;
// endmodule

// module XOR(in1,in2,result);
// input [31:0] in1;
// input [31:0] in2;
// output [31:0] result;
// assign result= in1^in2;
// endmodule

// module Full_Adder(
//     input a,
//     input b,
//     input cin,
//     output sum,
//     output cout
// );

// assign sum = a ^ b ^ cin;
// assign cout = (a & b)|(b & cin)|(cin & a);
               
// endmodule

// module add_1bit_full (sum, a, b, cin);
//     input a, b, cin;
//     output sum;
//     assign sum = a ^ b ^ cin;
// endmodule

// /* Using 2's complement logic */


// // adder by look-ahead logic
// module ADDER(sum, in1, in2);
//     input [31:0] in1, in2;
//     output [31:0] sum;
//     assign sum = in1+in2;

// endmodule

// // Subtract using 2'scomplement and addder
// module SUBTRACTER(sub, in1, in2);
//     input [31:0] in1, in2;
//     output [31:0] sub;
//     // assign sub = in1-in2;
//    wire [31:0] inv;
//    wire [31:0] one = 32'b1;
//    wire [31:0] comp_2;

//    NOT COMP (in2, inv);
//    ADDER ADD1 (comp_2, inv, one);
//    ADDER ADD2 (sub, in1, comp_2);
// endmodule





//****************

//------------------------------------------------- Not [32-bit] -----------------------------------------------
module Not(
    input [31:0] A,
    output [31:0] Result
);
    
    assign Result = ~A;

endmodule

//------------------------------------------------- Adder [32-bit] -----------------------------------------------
module Full_Adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

assign sum = a ^ b ^ cin;
assign cout = (a & b)|(b & cin)|(cin & a);
                
endmodule


module Adder (
    input [31:0] A,
    input [31:0] B,
    output [31:0] Sum
);
    assign sum = A+B;

endmodule 


//------------------------------------------------- Substractor [32-bit] -----------------------------------------------

module Subtractor (
    input [31:0] A,
    input [31:0] B,
    output [31:0] Diff
);

   wire [31:0] inverse;
   wire [31:0] dummy = 32'd1;
   wire [31:0] comp_2;

//    Not COMP (B, inverse);
   assign inverse = ~B;
   Adder ADD1 (comp_2, inverse, dummy);
   Adder ADD2 (Diff, A, comp_2);
endmodule

//------------------------------------------------- And [32-bit] -----------------------------------------------
module And (
    input [31:0] A,
    input [31:0] B,
    output [31:0] Result
);
    
    assign Result = A & B;

endmodule

//------------------------------------------------- Or [32-bit] -----------------------------------------------
module Or (
    input [31:0] A,
    input [31:0] B,
    output [31:0] Result
);

    assign Result = A | B;

endmodule

//------------------------------------------------- Xor [32-bit] -----------------------------------------------
module Xor(
    input [31:0] A,
    input [31:0] B,
    output [31:0] Result
);
    
    assign Result = A ^ B;

endmodule



//------------------------------------------------- Shift-Left-Arithmetic [32-bit] -----------------------------------------------
module Shift_Left_Arithmetic (
    input [31:0] A,
    input [31:0] B,
    output [31:0] Result
);

    assign Result = A <<< B[0];

endmodule

//------------------------------------------------- Shift-Right-Arithmetic [32-bit] -----------------------------------------------
module Shift_Right_Arithmetic (
    input [31:0] A,
    input [31:0] B,
    output [31:0] Result
);

    assign Result = A >>> B[0];

endmodule

//------------------------------------------------- Shift-Right-Logical [32-bit] -----------------------------------------------
module Shift_Right_Logical (
    input [31:0] A,
    input [31:0] B,
    output [31:0] Result
);

    assign Result = A >> B[0];

endmodule


//-------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------- ALU_module [top-module] -----------------------------------------------

// module ALU_module(in1,in2,func,result);
// input [31:0] in1;
// input [31:0] in2;
// input [3:0] func;
// output reg [31:0] result;
// wire [31:0] out[8:0];
// wire cout;

// Adder ADD(out[0],in1,in2);
// Subtractor SUB(out[1],in1,in2);
// And AND(in1,in2,out[2]);
// Or OR(in1,in2,out[3]);
// Xor XOR(in1,in2,out[4]);
// Not NOT(in1,out[5]);
// Shift_Left_Arithmetic SLA(in1,in2,out[6]);
// Shift_Right_Arithmetic SRA(in1,in2,out[7]);
// Shift_Right_Logical SRL(in1,in2,out[8]);

// always @(func or in1 or in2) begin
// case(func) 
//     4'b0000:  #100 result <= out[0];
//     4'b0001:  #100 result <= out[1];
//     4'b0010:  #100 result <= out[2];
//     4'b0011:  #100 result <= out[3];
//     4'b0100:  #100 result <= out[4];
//     4'b0101:  #100 result <= out[5];
//     4'b0110:  #100 result <= out[6];
//     4'b0111:  #100 result <= out[7];
//     4'b1000:  #100 result <= out[8];
// endcase
// end

module ALU_module(
    input [31:0] A,
    input [31:0] B,
    input [3:0] func,
    output reg[31:0] result
);
    
    // reg signed [31:0] _A, _B;                                  // Register for temporary storage of inputs
    // reg signed _Cin, _Bin;                                     // Register for temporary storage of inputs
    // wire _Cout, _Bout;
    wire [31:0] r0, r1, r2, r3, r4, r5, r6, r7, r8;
    
    // always @(A or B) begin
    //     _A = A;
    //     _B = B;
    //     _Cin = 1'b0;
    //     _Bin = 1'b0;
    // end

    // Instances of sub-modules
    Adder ADD(A, B, r0);
    Subtractor SUB(A, B, r1);
    And AND(A, B, r2);
    Or OR(A, B, r3);
    Xor XOR(A, B, r4);
    Not NOT(A, r5);
    Shift_Left_Arithmetic SLA(A, B, r6);
    Shift_Right_Arithmetic SRA(A, B, r7);
    Shift_Right_Logical SRL(A, B, r8);
    
    //Decoder
    always @(func or A or B) begin
        case(func)
            4'b0000: #100 result = r0;       // ADD
            4'b0001: #100 result = r1;       // SUB
            4'b0010: #100 result = r2;       // AND
            4'b0011: #100 result = r3;       // OR
            4'b0100: #100 result = r4;       // XOR
            4'b0101: #100 result = r5;       // NOT
            4'b0110: #100 result = r6;       // SLA
            4'b0111: #100 result = r7;       // SRA
            4'b1000: #100 result = r8;       // SRL
        endcase
    end

endmodule

