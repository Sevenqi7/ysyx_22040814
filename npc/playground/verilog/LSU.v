import "DPI-C" function void dci_pmem_write(input longint waddr, input longint wdata, input byte wmask);
import "DPI-C" function void dci_pmem_read(input longint raddr, output longint rdata, input byte rmask);

module LSU(input [63:0] addr, input [3:0] LsuType, input WriteEn, input [63:0]WriteData, output reg [63:0] ReadData);

    wire [7:0] mask;
    assign mask = ~(8'hFF << LsuType);
        always@(*) begin
            if(WriteEn) begin
                dci_pmem_write(addr, WriteData, mask);
                ReadData = 64'h0;
            end
            else begin
                dci_pmem_read(addr, ReadData, mask);
            end
        end
endmodule