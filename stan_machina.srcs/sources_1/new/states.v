`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2024 15:01:00
// Design Name: 
// Module Name: states
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module states(
    input clk,
    input rst,
    input send,
    input [7:0] data,
    output txd,
    output [1:0] current_state
    );
    
    localparam STATE0=2'd0;
    localparam STATE1=2'd1;
    localparam STATE2=2'd2;
    localparam STATE3=2'd3;
    reg [7:0] d=0;
    reg [1:0]state=STATE0;
    reg r_y=1'b0;
    reg last_send=0;
    reg [3:0]cnt=0;
    always @(posedge clk)
    begin
        last_send<=send;
        if(rst) 
        begin
            state<=STATE0;
            cnt<=0;
        end
        else
           begin
           case(state)
           STATE0:
           begin
            if(last_send==0 && send==1) 
            begin
                state<=STATE1;
                d<=data;
            end
           end
           STATE1:
           begin
            r_y<=1'b1;
            state<=STATE2;
           end

           STATE2:
           begin
                if(cnt==7)
                begin
                    cnt<=0;
                    r_y<=d[cnt];
                    state<=STATE3;
                end
                else
                begin
                    r_y<=d[cnt];
                    cnt<=cnt+1;

                end
           end
           STATE3:
           begin
            r_y<=1'b0;
            state<=STATE0;
           end
           endcase
       end
   end
   assign txd=r_y;
   assign current_state=state;
endmodule
