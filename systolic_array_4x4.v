`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/11/04 04:34:59
// Design Name: 
// Module Name: systolic_array_4x4
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


module systolic_array_4x4(
    input clk,
    input rst_n,
    input clear_acc,
    input enable,
    input signed [7:0] a_in0,
    input signed [7:0] a_in1,
    input signed [7:0] a_in2,
    input signed [7:0] a_in3,
    input signed [7:0] b_in0,
    input signed [7:0] b_in1,
    input signed [7:0] b_in2,
    input signed [7:0] b_in3,
    output signed [31:0] acc_00,
    output signed [31:0] acc_01,
    output signed [31:0] acc_02,
    output signed [31:0] acc_03,
    output signed [31:0] acc_10,
    output signed [31:0] acc_11,
    output signed [31:0] acc_12,
    output signed [31:0] acc_13,
    output signed [31:0] acc_20,
    output signed [31:0] acc_21,
    output signed [31:0] acc_22,
    output signed [31:0] acc_23,
    output signed [31:0] acc_30,
    output signed [31:0] acc_31,
    output signed [31:0] acc_32,
    output signed [31:0] acc_33
    );

    wire signed [7:0] a_w_00_to_01;
    wire signed [7:0] a_w_01_to_02;
    wire signed [7:0] a_w_02_to_03;
    wire signed [7:0] a_w_10_to_11;
    wire signed [7:0] a_w_11_to_12;
    wire signed [7:0] a_w_12_to_13;
    wire signed [7:0] a_w_20_to_21;
    wire signed [7:0] a_w_21_to_22;
    wire signed [7:0] a_w_22_to_23;
    wire signed [7:0] a_w_30_to_31;
    wire signed [7:0] a_w_31_to_32;
    wire signed [7:0] a_w_32_to_33;
    wire signed [7:0] b_w_00_to_10;
    wire signed [7:0] b_w_10_to_20;
    wire signed [7:0] b_w_20_to_30;
    wire signed [7:0] b_w_01_to_11;
    wire signed [7:0] b_w_11_to_21;
    wire signed [7:0] b_w_21_to_31;
    wire signed [7:0] b_w_02_to_12;
    wire signed [7:0] b_w_12_to_22;
    wire signed [7:0] b_w_22_to_32;
    wire signed [7:0] b_w_03_to_13;
    wire signed [7:0] b_w_13_to_23;
    wire signed [7:0] b_w_23_to_33;

    pe_os pe_00 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .clear_acc(clear_acc),
        .a(a_in0),
        .b(b_in0),
        .a_out(a_w_00_to_01),
        .b_out(b_w_00_to_10),
        .acc_out(acc_00)
    );
    
       pe_os pe_01 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .clear_acc(clear_acc),
        .a(a_w_00_to_01),
        .b(b_in1),
        .a_out(a_w_01_to_02),
        .b_out(b_w_01_to_11),
        .acc_out(acc_01)
    );

           pe_os pe_02 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .clear_acc(clear_acc),
        .a(a_w_01_to_02),
        .b(b_in2),
        .a_out(a_w_02_to_03),
        .b_out(b_w_02_to_12),
        .acc_out(acc_02)
    );

        pe_os pe_03 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .clear_acc(clear_acc),
        .a(a_w_02_to_03),
        .b(b_in3),
        .a_out(),
        .b_out(b_w_03_to_13),
        .acc_out(acc_03)
    );

        pe_os pe_10 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .clear_acc(clear_acc),
        .a(a_in1),
        .b(b_w_00_to_10),
        .a_out(a_w_10_to_11),
        .b_out(b_w_10_to_20),
        .acc_out(acc_10)
    );

            pe_os pe_11 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .clear_acc(clear_acc),
        .a(a_w_10_to_11),
        .b(b_w_01_to_11),
        .a_out(a_w_11_to_12),
        .b_out(b_w_11_to_21),
        .acc_out(acc_11)
    );

        pe_os pe_12 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .clear_acc(clear_acc),
        .a(a_w_11_to_12),
        .b(b_w_02_to_12),
        .a_out(a_w_12_to_13),
        .b_out(b_w_12_to_22),
        .acc_out(acc_12)
    );

    pe_os pe_13 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .clear_acc(clear_acc),
        .a(a_w_12_to_13),
        .b(b_w_03_to_13),
        .a_out(),
        .b_out(b_w_13_to_23),
        .acc_out(acc_13)
    );

        pe_os pe_20 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .clear_acc(clear_acc),
        .a(a_in2),
        .b(b_w_10_to_20),
        .a_out(a_w_20_to_21),
        .b_out(b_w_20_to_30),
        .acc_out(acc_20)
    );

    pe_os pe_21 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .clear_acc(clear_acc),
        .a(a_w_20_to_21),
        .b(b_w_11_to_21),
        .a_out(a_w_21_to_22),
        .b_out(b_w_21_to_31),
        .acc_out(acc_21)
    );

    pe_os pe_22 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .clear_acc(clear_acc),
        .a(a_w_21_to_22),
        .b(b_w_12_to_22),
        .a_out(a_w_22_to_23),
        .b_out(b_w_22_to_32),
        .acc_out(acc_22)
    );

        pe_os pe_23 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .clear_acc(clear_acc),
        .a(a_w_22_to_23),
        .b(b_w_13_to_23),
        .a_out(),
        .b_out(b_w_23_to_33),
        .acc_out(acc_23)
    );

        pe_os pe_30 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .clear_acc(clear_acc),
        .a(a_in3),
        .b(b_w_20_to_30),
        .a_out(a_w_30_to_31),
        .b_out(),
        .acc_out(acc_30)
    );

        pe_os pe_31 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .clear_acc(clear_acc),
        .a(a_w_30_to_31),
        .b(b_w_21_to_31),
        .a_out(a_w_31_to_32),
        .b_out(),
        .acc_out(acc_31)
    );

        pe_os pe_32 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .clear_acc(clear_acc),
        .a(a_w_31_to_32),
        .b(b_w_22_to_32),
        .a_out(a_w_32_to_33),
        .b_out(),
        .acc_out(acc_32)
    );
    
        pe_os pe_33 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .clear_acc(clear_acc),
        .a(a_w_32_to_33),
        .b(b_w_23_to_33),
        .a_out(),
        .b_out(),
        .acc_out(acc_33)
    );

endmodule
