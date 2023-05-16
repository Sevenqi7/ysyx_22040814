import "DPI-C" function void dci_pmem_write(input longint waddr, input longint wdata, input byte wmask);
import "DPI-C" function void dci_pmem_read(input longint raddr, output longint rdata, input byte rmask);

module sim_sram(
    input       [63:0]      pc          ,         //for debug
    input                   aresetn     ,
    input                   aclk        ,
    //ar
    input       [31:0]      araddr      , 
    input       [3: 0]      arid        ,
    input       [7: 0]      arlen       ,
    input       [2: 0]      arsize      ,
    input       [1: 0]      arlock      ,
    input       [1: 0]      arburst     ,
    input       [3: 0]      arcache     ,
    input       [2: 0]      arprot      ,
    input                   arvalid     ,
    output                  arready     ,
    //r
    output      [3: 0]      rid         ,
    output      [63:0]      rdata       ,
    output      [1: 0]      rresp       ,
    output                  rlast       ,
    output                  rvalid      ,
    input                   rready      ,
    //aw
    input       [3: 0]      awid        ,
    input       [31:0]      awaddr      ,
    input       [7: 0]      awlen       ,
    input       [2: 0]      awsize      ,
    input       [1: 0]      awburst     ,
    input       [1: 0]      awlock      ,
    input       [3: 0]      awcache     ,
    input       [2: 0]      awprot      ,
    input                   awvalid     ,
    output                  awready     , 
    //w
    input       [3: 0]      wid         ,
    input       [63:0]      wdata       , 
    input       [7: 0]      wstrb       ,
    input                   wlast       ,
    input                   wvalid      ,
    output                  wready      ,
    //b
    output      [3: 0]      bid         ,
    output      [1: 0]      bresp       ,
    output                  bvalid      ,
    input                   bready
);

    reg arready_r, rvalid_r, awready_r, wready_r, bvalid_r, rlast_r;
    reg [1:0] rresp_r, bresp_r;
    reg [3:0] rid_r, bid_r;
    reg [63:0] rdata_r;
    reg [31:0] awaddr_r;
 
    assign arready = arready_r;
    assign rvalid = rvalid_r;
    assign awready = awready_r;
    assign wready = wready_r;
    assign bvalid = bvalid_r;
    assign bid   = bid_r;
    assign rid   = rid_r;
    assign rlast = rlast_r;
    assign rresp = rresp_r;
    assign bresp = bresp_r;
    assign rdata = rdata_r;

    //ar      
    always@(posedge aclk) begin
        if(!aresetn) begin
            arready_r <= 1'b0;
        end
        // else if(arvalid) begin
        //     arready_r <= 1'b1;
        // end
        else 
            arready_r <= 1'b1;
    end

    //rresp
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

    //r
    reg [7:0] rcnt;
    reg [7:0] roffset;
    always@(posedge aclk) begin
        if(!aresetn) begin
            rdata_r = 64'b0;
            rcnt    = 8'b0;
            roffset = 8'b0;
            rlast_r = 1'b0;
        end
        else begin
            if(arready_r & arvalid) begin
                dci_pmem_read({32'H0000, araddr+{24'b0, roffset}}, rdata_r, 8'HFF);
                rcnt = rcnt + 1'b1;
                $display("addr:0x%x, rdata:0x%x, rlast:%d, roffset:%d, rcnt:%d", araddr+{24'b0, roffset}, rdata_r, rlast_r, roffset, rcnt);
                roffset = roffset + (1 << arsize);
                if(rcnt >= arlen) begin
                    rcnt    = 8'b0;
                    roffset = 8'b0;
                    rlast_r = 1'b1;
                end
                // $display("raddr:0x%x rdata:0x%x", araddr, rdata);
            end
            else begin
                roffset = 8'b0;
                rlast_r = 1'b0;
                rcnt    = 8'b0;
            end
        end
        // $display("addr:0x%x, rdata:0x%x, rlast:%d, roffset:%d", araddr+{24'b0, roffset}, rdata_r, rlast_r, roffset);
    end

    //aw
    always@(posedge aclk) begin
        if(!aresetn) begin
            awready_r <= 1'b1;
            awaddr_r <= 32'b0;
        end
        else begin
            if(awvalid) begin
                awaddr_r <= awaddr;
                awready_r <= 1'b1;
            end
        end
    end

    //w
    always@(posedge aclk) begin
        if(!aresetn) begin
            wready_r <= 1'b1;
        end
        else begin
            if(wvalid & awvalid)  begin
                dci_pmem_write({32'H0000, awaddr}, wdata, wstrb);
            end
        end
    end

    //b
    always@(posedge aclk) begin
        if(!aresetn) begin
            bvalid_r <= 1'b0;
            bresp_r  <= 2'b00;
        end
        else begin
            if(wready_r & wvalid & wready_r) begin
                bvalid_r <= 1'b1;
                bresp_r  <= 2'b00;
            end
            else if(bready & bvalid_r)
                bvalid_r <= 1'b0;
        end
    end

endmodule