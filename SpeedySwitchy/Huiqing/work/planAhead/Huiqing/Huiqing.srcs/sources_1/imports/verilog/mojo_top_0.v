/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [7:0] io_seg,
    output reg [5:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    input next
  );
  
  
  
  reg rst;
  
  reg [7:0] result;
  
  reg [15:0] ones;
  
  reg [15:0] tens;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  reg [31:0] M_seed_d, M_seed_q = 1'h0;
  wire [16-1:0] M_ctr_value;
  counter_2 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  wire [7-1:0] M_player_1_seg_seg;
  wire [3-1:0] M_player_1_seg_sel;
  reg [12-1:0] M_player_1_seg_values;
  multi_seven_seg_3 player_1_seg (
    .clk(clk),
    .rst(rst),
    .values(M_player_1_seg_values),
    .seg(M_player_1_seg_seg),
    .sel(M_player_1_seg_sel)
  );
  wire [7-1:0] M_player_2_seg_seg;
  wire [3-1:0] M_player_2_seg_sel;
  reg [12-1:0] M_player_2_seg_values;
  multi_seven_seg_3 player_2_seg (
    .clk(clk),
    .rst(rst),
    .values(M_player_2_seg_values),
    .seg(M_player_2_seg_seg),
    .sel(M_player_2_seg_sel)
  );
  localparam HOLD_state = 1'd0;
  localparam START_state = 1'd1;
  
  reg M_state_d, M_state_q = HOLD_state;
  wire [32-1:0] M_pn_gen_num;
  reg [1-1:0] M_pn_gen_rst;
  reg [1-1:0] M_pn_gen_next;
  reg [32-1:0] M_pn_gen_seed;
  pn_gen_5 pn_gen (
    .clk(clk),
    .rst(M_pn_gen_rst),
    .next(M_pn_gen_next),
    .seed(M_pn_gen_seed),
    .num(M_pn_gen_num)
  );
  
  always @* begin
    M_state_d = M_state_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    M_pn_gen_seed = M_seed_q;
    M_pn_gen_next = 1'h0;
    M_pn_gen_rst = rst;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    tens = M_ctr_value / 4'ha;
    ones = M_ctr_value - tens * 4'ha;
    M_player_1_seg_values = {M_ctr_value[8+3-:4], tens[0+3-:4], ones[0+3-:4]};
    M_player_2_seg_values = {M_ctr_value[8+3-:4], tens[0+3-:4], ones[0+3-:4]};
    io_seg = ~M_player_1_seg_seg;
    io_seg = ~M_player_2_seg_seg;
    io_sel[0+2-:3] = ~M_player_1_seg_sel;
    io_sel[3+2-:3] = ~M_player_2_seg_sel;
    result = M_pn_gen_num[0+7-:8];
    led[0+7-:8] = result;
    
    case (M_state_q)
      HOLD_state: begin
        led[0+7-:8] = result;
        if (io_button[0+0-:1] == 1'h1) begin
          M_state_d = START_state;
        end
      end
      START_state: begin
        M_pn_gen_next = 1'h1;
        M_state_d = HOLD_state;
        result = M_pn_gen_num[0+7-:8];
        led[0+7-:8] = result;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_seed_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_seed_q <= M_seed_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule