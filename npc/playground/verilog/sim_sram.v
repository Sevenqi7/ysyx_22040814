import "DPI-C" function void dci_pmem_write(input longint waddr, input longint wdata, input byte wmask);
import "DPI-C" function void dci_pmem_read(input longint raddr, output longint rdata, input byte rmask);

module sim_sram(
    input       [63:0]      pc          ,         //for debug
    input                   aresetn     ,
    input                   aclk        ,
    //ar
    input       [31:0]      araddr      ,
    input                   arvalid     ,
    output reg              arready     ,
    //r
    output reg  [63:0]      rdata       ,
    output reg  [1: 0]      rresp       ,
    output reg              rvalid      ,
    input                   rready      ,
    //aw
    input       [31:0]      awaddr      ,
    input                   awvalid     ,
    output reg              awready     , 
    //w
    input       [63:0]      wdata       , 
    input       [7: 0]      wstrb       ,
    input                   wvalid      ,
    output reg              wready      ,
    //b
    output reg  [1: 0]      bresp       ,
    output reg              bvalid      ,
    input                   bready
);

    reg arready_r, rvalid_r, awready_r, wready_r, bvalid_r;
    reg [1:0] rresp_r, bresp_r;
    reg [63:0] rdata_r;

    reg [31:0] araddr_r;

    assign arready = arready_r;
    assign rvalid = rvalid_r;
    assign awready = awready_r;
    assign wready = wready_r;
    assign bvalid = bvalid_r;
    assign rresp = rresp_r;
    assign bresp = bresp_r;
    assign rdata = rdata_r;

    //ar
    always@(posedge aclk) begin
        if(!aresetn) begin
            arready_r <= 1'b1;
            araddr_r  <= 32'b0;
        end
        else if(arvalid) begin
            arready_r <= 1'b1;
            araddr_r <= araddr;
        end
        else 
            arready_r <= 1'b1;
    end

    always@(posedge aclk) begin
        if(!aresetn) begin
            rvalid_r <= 1'b0;
            rresp_r  <= 2'b0;
        end
        else begin
            if(arready_r & arvalid) begin
                rvalid_r <= 1'b1;
                rresp_r  <= 2'b00;
            end
            else if(rvalid_r & rready) begin
                rvalid_r <= 1'b0;
            end
        end 
    end

    always@(posedge aclk) begin
        if(!aresetn) begin
            rdata_r = 64'b0;
        end
        else begin
            if(arready_r & arvalid)
                dci_pmem_read({32'H8000, araddr_r}, rdata_r, 8'HFF);
        end
        $display("addr:0x%x, rdata:0x%x", araddr_r, rdata_r);
    end

endmodule
