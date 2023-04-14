import "DPI-C" function void dci_pmem_write(input longint waddr, input longint wdata, input byte wmask);
import "DPI-C" function void dci_pmem_read(input longint raddr, output longint rdata, input byte rmask);

module sim_sram(
    input  [63:0]    pc         ,     //for debug
    input            aresetn    ,
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

reg aready, rresp, rvalid, awready, wready, bvalid;
reg [1:0] bresp; 
reg [63:0] rdata;
reg [63:0] wdata_r;
assign rdata = rdata_r;

//ar
always@(posedge aclk) begin
  if(!aresetn) begin
      arready <= 1'b1;
  end
  else begin
    arready <= 1'b1;
    if(arvalid & arready) begin
        dci_pmem_read(raddr, rdata_r, 8'hFF);
    end
  end
end
//r
always@(posedge aclk) begin
  if(!aresetn) 
      rvalid <= 1'b0;
  else begin
    if(arvalid & arready) begin
        rvalid <= 1'b1;
        rresp  <= 2'b00;
        if(rready)
            rdata <= rdata_r;
    end
  end
  else begin
      rvalid <= 1'b0;
      rresp  <= 2'b00;
  end
end

//aw
always@(posedge aclk) begin
  if(!aresetn)
      awready <= 1'b1;
  else if(awvalid & awready) begin
      wdata_r <= wdata;
  end
  else
      awready <= 1'b1;
end

//w
always@(posedge aclk) begin
  if(!aresetn)
      wready <= 1'b1;
  else if(wvalid & wready) begin
      dci_pmem_write(waddr, wdata_r, wstrb);
      bvalid <= 1'b1;
  end
end

always@(posedge aclk) begin
    bvalid <= 1'b1;     //write is always successful
    brresp <= 2'b00;
end

endmodule