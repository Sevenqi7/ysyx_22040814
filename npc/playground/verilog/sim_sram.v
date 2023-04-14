import "DPI-C" function void dci_pmem_write(input longint waddr, input longint wdata, input byte wmask);
import "DPI-C" function void dci_pmem_read(input longint raddr, output longint rdata, input byte rmask);

module sim_sram(
    input  [63:0]    pc         ,     //for debug
    input            aclk       ,
    //ar
    input  [31:0]    araddr     ,
    input            arvalid    ,
    output           arready     ,
    //r
    output [63:0]    rdata      ,
    output [1 :0]    rresp      ,
    output           rvalid     ,
    input            rready     ,
    //aw
    input  [31:0]    awaddr     ,
    input            awvalid    ,
    output           awready    ,
    //w
    input  [63:0]    wdata      ,
    input  [7: 0]    wstrb      ,
    input            wvalid     ,
    output           wready     ,
    //b
    output [1: 0]    bresp      ,
    output           bvalid     ,
    input            bready     
);

reg aready, rresp, rvalid, awready, wready, [1:0] bresp, bvalid; 

reg [63:0] data_r, [31:0] waddr_r, [31:0] raddr_r;
assign rdata = rdata_r;

always@(posedge aclk) begin
    if(arvalid & arready) begin
        raddr_r <= araddr;
        arready <= 1'b0;
    end
    else if(!arready) begin
        dci_pmem_read(raddr_r, rdata, 8'hFF);
        arvalid <= 1'b1;
    end
    else if(rready) begin
        arvalid <= 1'b0;
        rresp <= 2'b00;
    end
    else begin
        arready <= 1'b1;
        arvalid <= 1'b0;
        rresp   <= 2'b00;
    end
end

always@(posedge aclk) begin
    if(awvalid & awready) begin
        waddr_r <= awaddr;
        awready <= 1'b0;
    end
    else if(wvalid & wready) begin
        dci_pmem_write(addr, wdata, wstrb);
        wready <= 1'b0;
        bresp  <= 2'b00;
    end
    else if(bready)
        bvalid <= 1'b1;
    else begin
        awready <= 1'b1;
        wready  <= 1'b1;
        bvalid  <= 1'b0;
        bresp   <= 2'b00;
    end
end

endmodule