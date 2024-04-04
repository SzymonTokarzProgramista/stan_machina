`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2024 15:34:27
// Design Name: 
// Module Name: read_stan_machina
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


module read_stan_machina #(
 parameter LENGTH =16
 )(
output [7:0] data,
output send
);
integer file;
reg [7:0]r_data=7'b0;
reg [7:0]i;
reg r_send=1'b0;
initial
begin
    file=$fopen("C:/Studia/Semestr_6/Systemy_Rekonfigurowalne/stan_machina.txt","rb");
    for(i=0;i<LENGTH;i=i+1)
    begin
        r_data=$fgetc(file);
        #24;
    end
    $fclose(file);
end

    always
    begin
    #2;
        r_send = 1'b1;
        #2;
        r_send = 1'b0;
        #20;
    end

assign data=r_data;
assign send=r_send;

endmodule
