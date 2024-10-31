//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module double_tokens
(
    input        clk,
    input        rst,
    input        a,
    output reg      b,
    output logic overflow
);
    // Task:
    // Implement a serial module that doubles each incoming token '1' two times.
    // The module should handle doubling for at least 200 tokens '1' arriving in a row.
    //
    // In case module detects more than 200 sequential tokens '1', it should assert
    // an overflow error. The overflow error should be sticky. Once the error is on,
    // the only way to clear it is by using the "rst" reset signal.
    //
    // Note:
    // Check the waveform diagram in the README for better understanding.
    //
    // Example:
    // a -> 10010011000110100001100100
    // b -> 11011011110111111001111110

    reg [8:0] count;
    reg prev;

    always_ff @(posedge clk posedge rst)
    if(rst)
        b <= '0;
        count <= '0;
        overflow <= '0;
        prev <= '0;
    else begin
        if(prev)
            if( count < 200)
                b <=  '1;
                prev <= '0;
                count <= count + 1;
            else overflow <= '1;
        else 
            if(a) begin
                prev <= '1;
                b <= '1;
            else
                b <= '0;
            end
    if (overflow) 
    $display("Overflow");
    end


endmodule
