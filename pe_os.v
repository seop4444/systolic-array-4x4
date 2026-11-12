`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/11/02 04:08:27
// Design Name: 
// Module Name: pe_os
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


module pe_os(
    input clk,
    input rst_n,
    input clear_acc,
    input enable,
    input signed [7:0] a,
    input signed [7:0] b,
    output reg signed [7:0] a_out,
    output reg signed [7:0] b_out,
    output reg signed [31:0] acc_out
    );

    wire signed [15:0] product;

    assign product = a*b;

    always@(posedge clk) begin
        if(!rst_n) begin
            a_out <=0;
            b_out <=0;
            acc_out <=0;
        end else begin
            if(enable) begin
                a_out<=a;
                b_out<=b;
            end if(clear_acc) begin
            acc_out <=0;
            end else if(enable) begin
                acc_out<=product+acc_out;
            end
        end
    end
endmodule
