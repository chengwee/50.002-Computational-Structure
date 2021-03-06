/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_18 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] alu,
    output reg [0:0] z,
    output reg [0:0] v,
    output reg [0:0] n
  );
  
  
  
  wire [16-1:0] M_adder_op;
  wire [1-1:0] M_adder_z;
  wire [1-1:0] M_adder_v;
  wire [1-1:0] M_adder_n;
  reg [6-1:0] M_adder_alufn;
  reg [16-1:0] M_adder_a;
  reg [16-1:0] M_adder_b;
  adder_26 adder (
    .alufn(M_adder_alufn),
    .a(M_adder_a),
    .b(M_adder_b),
    .op(M_adder_op),
    .z(M_adder_z),
    .v(M_adder_v),
    .n(M_adder_n)
  );
  
  wire [16-1:0] M_compare_op;
  reg [6-1:0] M_compare_alufn;
  reg [1-1:0] M_compare_z;
  reg [1-1:0] M_compare_v;
  reg [1-1:0] M_compare_n;
  compare_27 compare (
    .alufn(M_compare_alufn),
    .z(M_compare_z),
    .v(M_compare_v),
    .n(M_compare_n),
    .op(M_compare_op)
  );
  
  wire [16-1:0] M_boolean_boole;
  reg [6-1:0] M_boolean_alufn;
  reg [16-1:0] M_boolean_a;
  reg [16-1:0] M_boolean_b;
  boolean_28 boolean (
    .alufn(M_boolean_alufn),
    .a(M_boolean_a),
    .b(M_boolean_b),
    .boole(M_boolean_boole)
  );
  
  wire [16-1:0] M_shifter_shift;
  reg [6-1:0] M_shifter_alufn;
  reg [16-1:0] M_shifter_a;
  reg [16-1:0] M_shifter_b;
  shifter_29 shifter (
    .alufn(M_shifter_alufn),
    .a(M_shifter_a),
    .b(M_shifter_b),
    .shift(M_shifter_shift)
  );
  
  always @* begin
    M_adder_alufn = alufn[0+5-:6];
    M_adder_a = a[0+15-:16];
    M_adder_b = b[0+15-:16];
    M_compare_alufn = alufn[0+5-:6];
    M_compare_z = M_adder_z;
    M_compare_v = M_adder_v;
    M_compare_n = M_adder_n;
    M_boolean_alufn = alufn[0+5-:6];
    M_boolean_a = a[0+15-:16];
    M_boolean_b = b[0+15-:16];
    M_shifter_alufn = alufn[0+5-:6];
    M_shifter_a = a;
    M_shifter_b = b;
    
    case (alufn[4+1-:2])
      2'h0: begin
        alu = M_adder_op;
      end
      2'h1: begin
        alu = M_boolean_boole;
      end
      2'h2: begin
        alu = M_shifter_shift;
      end
      2'h3: begin
        alu = M_compare_op;
      end
      default: begin
        alu = M_adder_op;
      end
    endcase
    
    case (alufn[0+5-:6])
      6'h02: begin
        alu = a * b;
      end
      6'h03: begin
        alu = a / b;
      end
    endcase
    z = M_adder_z;
    v = M_adder_v;
    n = M_adder_n;
  end
endmodule
