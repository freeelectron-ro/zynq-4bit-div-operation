`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Grig Barbulescu
// 
// Create Date: 01/17/2016 04:48:20 PM
// Design Name: 
// Module Name: div
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


module div( input  clk, 
            input  [7:0] A,
            input  [3:0] B,
            output reg [3:0] Q,
            output reg [3:0] R
          );

wire [3:0] Q_pre;
wire [3:0] R_pre;

assign Q_pre = A / B;
assign R_pre = A - Q * B;


always @(posedge clk)
begin
    Q <= Q_pre;
    R <= R_pre;
end

endmodule
