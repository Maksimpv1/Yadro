//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module round_robin_arbiter_with_2_requests
(
    input        clk,
    input        rst,
    input  [1:0] requests,
    output [1:0] grants
);
    // Task:
    // Implement a "arbiter" module that accepts up to two requests
    // and grants one of them to operate in a round-robin manner.
    //
    // The module should maintain an internal register
    // to keep track of which requester is next in line for a grant.
    //
    // Note:
    // Check the waveform diagram in the README for better understanding.
    //
    // Example:
    // requests -> 01 00 10 11 11 00 11 00 11 11
    // grants   -> 01 00 10 01 10 00 01 00 10 01

    typedef enum logic [1:0] {
        grant0 = 2'b00, 
        grant1 = 2'b01 
    } state_t;

    state_t state, next_state;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) state <= grant0; 
        else state <= next_state; 
    end

    always_comb begin
        grants = 2'b00; 
        next_state = state; 

        case (state)
            grant0: 
                if (requests[0]) 
                    grants = 2'b01; 
                    next_state = grant1; 
                 else if (requests[1]) 
                    grants = 2'b10; 
                    next_state = grant0; 
            grant1: 
                if (requests[1]) 
                    grants = 2'b10; 
                    next_state = grant0; 
                 else if (requests[0]) 
                    grants = 2'b01; 
                    next_state = grant1;
        endcase
    end


endmodule
