//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module posedge_detector (input clk, rst, a, output detected);

  logic a_r;

  // Note:
  // The a_r flip-flop input value d propogates to the output q
  // only on the next clock cycle.

  always_ff @ (posedge clk)
    if (rst)
      a_r <= '0;
    else
      a_r <= a;

  assign detected = ~ a_r & a;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module one_cycle_pulse_detector (input clk, rst, a, output detected);

  // Task:
  // Create an one cycle pulse (010) detector.
  //
  // Note:
  // See the testbench for the output format ($display task).

logic [1:0] state, next_state;

localparam S0 = 2'b00;
localparam S1 = 2'b01;
localparam S2 = 2'b10;

always_ff @(posedge clk) begin
  if(rst)
    state <= S0
  else
    state <= next_state;
end

always_comb @(posedge clk or posedge rst) begin
  case (state)
  S0: if (!a) next_state = S1; 
      else next_state = S0;
  S1: if (a) next_state = S2;
      else next_state = S1;
  S2: next_state = S0

  default: next_state = S0;
  endcase

end

assign detected = (state == S2 && a == 0);



endmodule
