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

module and_gate_using_mux
(
    input  a,
    input  b,
    output o
);

  // Task:
  // Implement and gate using instance(s) of mux,
  // constants 0 and 1, and wire connections

  wire d0,d1;
  wire out;

  assign d0 = 1'b0;
  assign d1 = 1'b1;

  mux one (
    .d0(d0),
    .d1(d1),
    .sel(a),
    .y(out)
);
  mux two (
    .d0(d0),
    .d1(out),
    .sel(b),
    .y(o)
);



endmodule
