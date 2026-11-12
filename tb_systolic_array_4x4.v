`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/11/10 04:07:39
// Design Name: 
// Module Name: tb_systolic_array_4x4
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


module tb_systolic_array_4x4();
    reg clk;
    reg rst_n;
    reg clear_acc;
    reg enable;
    reg signed [7:0] a_in0;
    reg signed [7:0] a_in1;
    reg signed [7:0] a_in2;
    reg signed [7:0] a_in3;
    reg signed [7:0] b_in0;
    reg signed [7:0] b_in1;
    reg signed [7:0] b_in2;
    reg signed [7:0] b_in3;
    wire signed [31:0] acc_00;
    wire signed [31:0] acc_01;
    wire signed [31:0] acc_02;
    wire signed [31:0] acc_03;
    wire signed [31:0] acc_10;
    wire signed [31:0] acc_11;
    wire signed [31:0] acc_12;
    wire signed [31:0] acc_13;
    wire signed [31:0] acc_20;
    wire signed [31:0] acc_21;
    wire signed [31:0] acc_22;
    wire signed [31:0] acc_23;
    wire signed [31:0] acc_30;
    wire signed [31:0] acc_31;
    wire signed [31:0] acc_32;
    wire signed [31:0] acc_33;

    systolic_array_4x4 dut (
        .clk(clk),
        .rst_n(rst_n),
        .clear_acc(clear_acc),
        .enable(enable),
        .a_in0(a_in0),
        .a_in1(a_in1),
        .a_in2(a_in2),
        .a_in3(a_in3),
        .b_in0(b_in0),
        .b_in1(b_in1),
        .b_in2(b_in2),
        .b_in3(b_in3),
        .acc_33(acc_33)
    );

    always #10 clk = ~clk;
    
    initial begin
        clk=0;
        rst_n=0;
        enable=0;
        clear_acc=0;
        a_in0=0;
        a_in1=0;
        a_in2=0;
        a_in3=0;
        b_in0=0;
        b_in1=0;
        b_in2=0;
        b_in3=0;

        #20 rst_n=1;
        #20 enable=1;
        #20 a_in3<=2; b_in3<=-3;

        #20 a_in3=0;
            b_in3=0;
        #60;

        if(acc_33==-6) begin
            $display("[PASS] Verification Success. acc_33=%d", acc_33);
        end else begin
            $display("[FAIL] acc_33=%d", acc_33);
        end

    $finish;

    end

endmodule
