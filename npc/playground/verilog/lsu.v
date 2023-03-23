import "DPI-C" function void pmem_write(input longint addr, input int len, input longint data);
import "DPI-C" function uint64_t pmem_read(input longint addr, input int len);

module sim_mem(input [63:0] addr, input [2:0] LsuType, input WriteEn, input [63:0]WriteData, output [63:0] ReadData);
        always@(*) begin
            if(WriteEn) begin
                pmem_write(addr, LSUType, WriteData);
            end
            else begin
                ReadData = pmem_read(addr, LSUType);
            end
        end
endmodule