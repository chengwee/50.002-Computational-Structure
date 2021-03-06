/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shifter_29 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] shift
  );
  
  
  
  always @* begin
    
    case (alufn[0+1-:2])
      2'h0: begin
        shift = a << b[0+4-:5];
      end
      2'h1: begin
        shift = a >> b[0+4-:5];
      end
      2'h3: begin
        shift = a >>> b[0+4-:5];
      end
      default: begin
        shift = 1'h0;
      end
    endcase
  end
endmodule
