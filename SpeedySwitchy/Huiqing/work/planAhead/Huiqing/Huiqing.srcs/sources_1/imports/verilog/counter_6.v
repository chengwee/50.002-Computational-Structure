/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     SIZE = DIGIT_BITS
     DIV = DIV
     TOP = DIGITS-1
     UP = 1
*/
module counter_6 (
    input clk,
    input rst,
    output reg [1:0] value
  );
  
  localparam SIZE = 2'h2;
  localparam DIV = 5'h10;
  localparam TOP = 3'h2;
  localparam UP = 1'h1;
  
  
  reg [17:0] M_ctr_d, M_ctr_q = 1'h0;
  
  localparam MAX_VALUE = 19'h2ffff;
  
  always @* begin
    M_ctr_d = M_ctr_q;
    
    value = M_ctr_q[16+1-:2];
    if (1'h1) begin
      M_ctr_d = M_ctr_q + 1'h1;
      if (1'h1 && M_ctr_q == 19'h2ffff) begin
        M_ctr_d = 1'h0;
      end
    end else begin
      M_ctr_d = M_ctr_q - 1'h1;
      if (1'h1 && M_ctr_q == 1'h0) begin
        M_ctr_d = 19'h2ffff;
      end
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ctr_q <= 1'h0;
    end else begin
      M_ctr_q <= M_ctr_d;
    end
  end
  
endmodule
