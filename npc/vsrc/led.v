module led(
    input clk,
    input rst,
    input sw,
    output [15:0] ledr
);
    reg [31:0] count;
    reg [15:0] led;
    always@(posedge clk) begin
        if(rst) begin
            led <= 1;
        end
        else begin
            if(count == 0)
                led <= {led[14:0], led[15]};
            count <= (count >= 100000 ? 32'b0 : count + 1);
        end 
    end

    assign ledr = sw ? led : 0;
endmodule
