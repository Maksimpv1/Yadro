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

module or_gate_using_mux
(
    input  a,
    input  b,
    output o
);

  // Task:

  // Implement or gate using instance(s) of mux,
  // constants 0 and 1, and wire connections

    mux mux1 (
    .d0(1'b0),
    .d1(1'b1),
    .sel(a),
    .y(o)
  );

  mux mux2 (
    .d0(o),
    .d1(1'b1),
    .sel(b),
    .y(o)
  );


endmodule
