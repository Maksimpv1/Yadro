//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux_2_1
(
  input  [3:0] d0, d1,
  input        sel,
  output [3:0] y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module mux_4_1
(
  input  [3:0] d0, d1, d2, d3,
  input  [1:0] sel,
  output [3:0] y
);

  // Task:
  // Implement mux_4_1 using three instances of mux_2_1

  wire [3:0] y0, y1;

  assign y0 = sel[0] ? d1 : d0;
  assign y1 = sel[0] ? d3 : d2;
  
  assign y = sel[1] ? y1 : y0 ;


endmodule

module mux_4_1_exampl (
  input  [3:0] d0, d1, d2, d3,
  input  [1:0] sel,
  output [3:0] y
);

  wire [3:0] y0, y1;

  mux_2_1 mux0 (
    .d0(d0),
    .d1(d1),
    .sel(sel[0]),
    .y(y0)
  );

  mux_2_1 mux1 (
    .d0(d2),
    .d1(d3),
    .sel(sel[0]),
    .y(y1)
  );

  assign y = sel[1] ? y1 : y0;

endmodule