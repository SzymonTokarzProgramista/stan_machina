`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2024 15:36:09
// Design Name: 
// Module Name: write1_stan_machina
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


module write1_stan_machina#
(
parameter LENGTH=16
)(
input data_in
);
reg [7:0]i;
integer file1;
initial
begin
    #3;
    file1=$fopen("C:/Studia/Semestr_6/Systemy_Rekonfigurowalne/output.txt","wb");
    for(i=0;i<LENGTH*12;i=i+1)
    begin
        $fwrite(file1,"%b",data_in);
        #2;
    end
    $fclose(file1);
    $finish;
end
endmodule
