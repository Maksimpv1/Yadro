//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module halve_tokens
(
    input  clk,
    input  rst,
    input  a,
    output reg b
);
    // Task:
    // Implement a serial module that reduces amount of incoming '1' tokens by half.
    //
    // Note:
    // Check the waveform diagram in the README for better understanding.
    //
    // Example:
    // a -> 110_011_101_000_1111
    // b -> 010_001_001_000_0101
    
    reg count; 

    always_ff @(posedge clk or posedge rst) begin
        if (rst) 
            b <= 0;
            count <= 0;
        else begin
            if (a) 
                if (count) b <= 1;
                           count <= 0;
                else b <= 0;
                     count <= 1;
            else b <= 0;
        end
    end


endmodule
