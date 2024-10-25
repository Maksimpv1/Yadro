//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux
(
  input  d0, d1,
  input  sel,
  output y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module not_gate_using_mux
(
    input  i,
    output o
);

  // Task:
  // Implement not gate using instance(s) of mux,
  // constants 0 and 1, and wire connections

  wire d0, d1;

  assign d0 = 1'b0; 
  assign d1 = 1'b1; 

  mux mux_i (
    .d0(d0),
    .d1(d1),
    .sel(i),
    .y(o)
  );

endmodule
