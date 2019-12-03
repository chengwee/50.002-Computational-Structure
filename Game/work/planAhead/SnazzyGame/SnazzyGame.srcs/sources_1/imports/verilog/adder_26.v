/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder_26 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] op,
    output reg [0:0] z,
    output reg [0:0] v,
    output reg [0:0] n
  );
  
  
  
  reg [15:0] op_sig;
  
  always @* begin
    
    case (alufn[0+0-:1])
      1'h0: begin
        op_sig = a + b;
        op = op_sig;
        z = (~|op_sig);
        v = (((a[15+0-:1]) & (b[15+0-:1]) & (~op_sig[15+0-:1])) | ((~a[15+0-:1]) & (~b[15+0-:1]) & (op_sig[15+0-:1])));
        n = op_sig[15+0-:1];
      end
      1'h1: begin
        op_sig = a - b;
        op = op_sig;
        z = (~|op_sig);
        v = (((a[15+0-:1]) & (b[15+0-:1]) & (~op_sig[15+0-:1])) | ((~a[15+0-:1]) & (~b[15+0-:1]) & (op_sig[15+0-:1])));
        n = op_sig[15+0-:1];
      end
      default: begin
        op_sig = a + b;
        op = op_sig;
        z = (~|op_sig);
        v = (((a[15+0-:1]) & (b[15+0-:1]) & (~op_sig[15+0-:1])) | ((~a[15+0-:1]) & (~b[15+0-:1]) & (op_sig[15+0-:1])));
        n = op_sig[15+0-:1];
      end
    endcase
  end
endmodule
