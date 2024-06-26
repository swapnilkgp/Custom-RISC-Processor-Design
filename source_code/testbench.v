`timescale 1ns / 1ps

module testbench;
    reg clk;                     
    
    TOPlevel DUT(clk);    
    
    initial
    begin
        clk = 0;
        forever #200 clk = ~clk;
    end


    
    initial
    begin 
        #250000 $finish;
    end
    
    
endmodule
