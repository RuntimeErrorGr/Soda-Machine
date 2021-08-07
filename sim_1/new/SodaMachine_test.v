`timescale 1ns / 1ps

module SodaMachine_test();
    reg clk, reset, B1, B5, B10;
    wire bottle, R1, R5;
    SodaMachine m(clk, reset, B1, B5, B10, bottle, R1, R5);
    always #10 clk = ~clk; 
    initial begin
     
        clk = 0;
        reset = 1;
        
        #15 reset = 0;
        #15 B1 = 1; B5 = 0; B10 = 0;
        #120 B1 = 0; B5 = 0; B10 = 1;
        
    end
    
endmodule
