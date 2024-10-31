//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module serial_to_parallel
# (
    parameter width = 8
)
(
    input                      clk,
    input                      rst,

    input                      serial_valid,
    input                      serial_data,

    output logic               parallel_valid,
    output logic [width - 1:0] parallel_data
);
    // Task:
    // Implement a module that converts serial data to the parallel multibit value.
    //
    // The module should accept one-bit values with valid interface in a serial manner.
    // After accumulating 'width' bits, the module should assert the parallel_valid
    // output and set the data.
    //
    // Note:
    // Check the waveform diagram in the README for better understanding.

    logic [width - 1:0] shift_reg; 
    reg count; 

    always_ff @(posedge clk or posedge rst)
        if (rst) 
            shift_reg <= 0;           
            count <= 0;              
            parallel_valid <= 0;      
        else if (serial_valid) begin
                shift_reg[count] <= serial_data; 
                count <= count + 1; 
                if (count == width - 1) 
                    parallel_valid <= 1; 
                    parallel_data <= shift_reg; 
                    count <= 0;
                 else parallel_valid <= 0; 
            end


endmodule
