module ps2_keyboard(clk,resetn,ps2_clk,ps2_data, data, state, push_cnt);
    input clk,resetn,ps2_clk,ps2_data;
    output [7:0] data;
    output reg [1:0] state = 2'b00;
    output reg [7:0] push_cnt = 8'b0;

    reg [9:0] buffer;        // ps2_data bits
    reg [3:0] count;  // count ps2_data bits
    reg [2:0] ps2_clk_sync;
    reg [7:0] data_buf;

    assign data = data_buf[7:0];
    always @(posedge clk) begin
        ps2_clk_sync <=  {ps2_clk_sync[1:0],ps2_clk};
    end

    wire sampling = ps2_clk_sync[2] & ~ps2_clk_sync[1];
    always @(posedge clk) begin
        if (resetn == 0) begin // reset
            count <= 0;
        end
        else begin
            if (sampling) begin
              if (count == 4'd10) begin
                if ((buffer[0] == 0) &&  // start bit
                    (ps2_data)       &&  // stop bit
                    (^buffer[9:1])) begin      // odd  parity
                    if(state == 2'b00) begin
                        data_buf <= buffer[8:1];
                        state <= 2'b01;
                        push_cnt <= push_cnt + 1'b1;
                        $display("push_cnt %x", push_cnt[7:0]);
                    end
                    else if(state == 2'b01) begin
                        if(buffer[8:1] == 8'hf0)
                            state <= 2'b10;
                    end
                    else if(state == 2'b10) begin
                        if(buffer[8:1] == data_buf[7:0])
                            state <= 2'b00;
                    end
          
                    $display("receive %x", buffer[8:1]);
                    // $display("receive %x", data_buf[7:0]);

                end
                count <= 0;     // for next
              end else begin
                buffer[count] <= ps2_data;  // store ps2_data
                count <= count + 3'b1;
              end
            end
        end
    end

endmodule