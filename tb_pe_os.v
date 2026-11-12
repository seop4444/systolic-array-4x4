`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/11/02 14:13:10
// Design Name: 
// Module Name: tb_pe_os
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


module tb_pe_os();

    reg clk;
    reg rst_n;
    reg clear_acc;
    reg enable;
    reg signed [7:0] a;
    reg signed [7:0] b;
    wire signed [7:0] a_out;
    wire signed [7:0] b_out;
    wire signed [31:0] acc_out;

    pe_os u_mac (
        .clk(clk),
        .rst_n(rst_n),
        .clear_acc(clear_acc),
        .enable(enable),
        .a(a),
        .b(b),
        .a_out(a_out),
        .b_out(b_out),
        .acc_out(acc_out)
    );

    always #10 clk = ~clk;

    initial begin
        clk=0;
        rst_n=0;
        enable=0;
        clear_acc=0;
        a=0;
        b=0;

        #20 rst_n = 1;
        
        enable=1;
        #20 a=2; b=3;

        #20 a=-2; b=4;

        #20 enable=0;

        if(acc_out==-2) begin
            $display("[PASS] Verification Success. acc_out = %d", acc_out);
        end else begin
            $display("[FAIL] Calculation Error. acc_out = %d", acc_out);
        end
        
        #20
        enable=0;
        clear_acc=1;
        #20
        if(acc_out==0) begin
            $display("[PASS]");
        end else begin
            $display("[FAIL]");
        end

        clear_acc=0;
        enable=1;
        a=3; b=5;
        #20
        enable=0;
        if(acc_out==15) begin
            $display("[PASS]");
        end else begin
            $display("[FAIL]");
        end 
        $finish;
    end
endmodule
