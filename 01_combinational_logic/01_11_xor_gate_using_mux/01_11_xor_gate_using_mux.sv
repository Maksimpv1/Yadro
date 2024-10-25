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

module xor_gate_using_mux
(
    input  a,
    input  b,
    output o
);

  // Task:
  // Implement xor gate using instance(s) of mux,
  // constants 0 and 1, and wire connections

  wire out_a, out_b;

    mux mux1 (
    .d0(b),
    .d1(1'b1),
    .sel(a),
    .y(out_a)
  );

  mux mux2 (
    .d0(out_a),
    .d1(1'b0),
    .sel(b),
    .y(o)
  );


endmodule
