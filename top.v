`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Grig Barbulescu 
// 
// Create Date: 01/17/2016 04:48:20 PM
// Design Name: 
// Module Name: top
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
//  This small sketch demonstrates the division operation on Zybo board.
//  This was implemented to use only the PL, but no PS nor ARM.
//  The usage is simple:
//   - on switches 3:0 select the upper four bits of dividend, then press&release button 3
//   - on switches 3:0 select the lower four bits of dividend, then press&release button 2
//   - on switches 3:0 select the four bits of divisor, then press&release button 1
//   - on LEDs 3:0 will be visible the four bits of the quotient
//   - if you push the button 0, on the LEDs will appear the four bits of the remainder
//////////////////////////////////////////////////////////////////////////////////


module top( input clk, 
            output reg [3:0] led,
            input  [3:0] btn,
            input  [3:0] sw );


 reg [7:0] A;
 reg [3:0] B;
wire [3:0] Q;
wire [3:0] R;

div inst( .clk(clk),
          .A(A),
          .B(B),
          .Q(Q),
          .R(R)
         );

always @(posedge clk)
begin
    if(btn[3]) A[7:4] <= sw[3:0];
    if(btn[2]) A[3:0] <= sw[3:0];
    if(btn[1]) B[3:0] <= sw[3:0];
    if(btn[0]) led[3:0] <= R[3:0];
    else       led[3:0] <= Q[3:0];
end

endmodule
