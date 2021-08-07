module SodaMachine(input clk, reset, B1, B5, B10, output reg bottle, R1, R5);
    reg[2:0] state, nextstate;
   
    parameter SUM0 = 3'b000;
    parameter SUM1 = 3'b001;
    parameter SUM2 = 3'b010;
    parameter GIVE1 = 3'b011;
    parameter GIVE2 = 3'b100;
    parameter GIVE3 = 3'b101;
    parameter GIVE4 = 3'b110;
    
    always@(posedge clk, posedge reset)
        if(reset)
            state <= SUM0;
        else
            state <= nextstate;
    always@(state, B1, B5, B10) 
        begin
            case(state)
                SUM0: begin
                    if(B1) begin
                        nextstate = SUM1;
                        bottle = 0;
                        R1 = 0;
                        R5 = 0;
                     end else if(B5) begin
                        nextstate = GIVE2;
                        bottle = 1;
                        R1 = 0;
                        R5 = 0;
                     end else if(B10) begin
                        nextstate = GIVE2;
                        bottle = 1;
                        R1 = 0;
                        R5 = 1;
                     end else begin
                        nextstate = SUM0;
                        bottle = 0;
                        R1 = 0;
                        R5 = 0;
                     end
                end
                
                SUM1: begin
                    if(B1) begin
                        nextstate = SUM2;
                        bottle = 0;
                        R1 = 0;
                        R5 = 0;
                     end else if(B5) begin
                        nextstate = GIVE3;
                        bottle = 1;
                        R1 = 0;
                        R5 = 0;
                     end else if(B10) begin
                        nextstate = GIVE3;
                        bottle = 1;
                        R1 = 0;
                        R5 = 1;
                     end else begin
                        nextstate = SUM1;
                        bottle = 0;
                        R1 = 0;
                        R5 = 0;
                     end
                end
                
                SUM2: begin
                    if(B1) begin
                        nextstate = SUM0;
                        bottle = 1;
                        R1 = 0;
                        R5 = 0;
                    end else if(B5) begin
                        nextstate = GIVE4;
                        bottle = 1;
                        R1 = 0;
                        R5 = 0;
                    end else if(B10) begin
                        nextstate = GIVE4;
                        bottle = 1;
                        R1 = 0;
                        R5 = 1;
                    end else begin
                        nextstate = SUM2;
                        bottle = 0;
                        R1 = 0;
                        R5 = 0;
                    end
                end
                
                GIVE1: begin
                    nextstate = SUM0;
                    bottle = 0;
                    R1 = 1;
                    R5 = 0;
                end
                
                GIVE2: begin
                    nextstate = GIVE1;
                    bottle = 0;
                    R1 = 1;
                    R5 = 0;
                end
                
                GIVE3: begin
                    nextstate = GIVE2;
                    bottle = 0;
                    R1 = 1;
                    R5 = 0;
                end
                
                GIVE4: begin
                    nextstate = GIVE3;
                    bottle = 0;
                    R1 = 1;
                    R5 = 0;
                end
            endcase
        end              
endmodule