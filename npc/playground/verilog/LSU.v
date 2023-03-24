import "DPI-C" function void dci_pmem_write(input longint waddr, input longint wdata, input byte wmask);
import "DPI-C" function void dci_pmem_read(input longint raddr, output longint rdata, input byte rmask);

module LSU(input [63:0] addr, input [4:0] LsuType, input WriteEn, input [63:0]WriteData, output [63:0] ReadData);

    wire [7:0] mask;
    wire [3:0] data_len;
    reg [63:0] data_r;
    assign data_len = LsuType[4:1];
    assign mask = ~(8'hFF << data_len);
    assign ReadData = LsuType[0] ? {(64-data_len){data_r[data_len-1]}, data_r} : {(64-data_len){1'b0} ,data_r};
        always@(*) begin
            if(WriteEn) begin
                dci_pmem_write(addr, WriteData, mask);
                ReadData = 64'h0;
            end
            else begin
                dci_pmem_read(addr, data_r, mask);
            end
        end
endmodule