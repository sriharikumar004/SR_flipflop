// SR Flip-Flop (with asynchronous reset)
module Sr_ff (
    input  wire clk, rst, S, R,
    output reg  Q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 1'b0;          // Asynchronous reset
        else begin
            case ({S,R})
                2'b00: Q <= Q;      // Hold
                2'b01: Q <= 1'b0;   // Reset
                2'b10: Q <= 1'b1;   // Set
                2'b11: Q <= 1'bx;   // Invalid (forbidden state)
            endcase
        end
    end
endmodule