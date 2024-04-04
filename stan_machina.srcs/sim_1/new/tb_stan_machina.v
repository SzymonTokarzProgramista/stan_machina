`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2024 15:30:13
// Design Name: 
// Module Name: tb_stan_machina
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


module tb_stan_machina(
    );
    localparam LENGTH = 16;
    wire [7:0] data_out;
    wire send;
    wire y;
    reg clk = 1'b0;
    wire [1:0] current_state;
    
        initial
            begin
            while(1)
                begin
                #1; clk=1'b0;
                #1; clk=1'b1;
            end
        end

    read_stan_machina #(
        .LENGTH(LENGTH)
    )
    reading(
        .data(data_out), 
        .send(send));
        
    states wysylanie(
        .clk(clk) ,
        .rst(1'b0) ,
        .send(send), 
        .data(data_out), 
        .txd(y),
        .current_state(current_state));
        
    write1_stan_machina #(
        .LENGTH(LENGTH)
    ) 
    zapis(
        .data_in(y));

endmodule
