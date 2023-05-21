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
    reg [1:0] rresp_r, bresp_r, arburst_r;
    reg [2:0] arsize_r;
    reg [3:0] rid_r, bid_r;
    reg [63:0] rdata_r;
    reg [31:0] awaddr_r, araddr_r;

    reg arv_arr_flag, awv_arw_flag;
    reg [7:0] arlen_cntr, arlen_r;

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
    // assign rdata = rdata_r;

    //ar
    always@(posedge aclk) begin
        if(!aresetn) begin
            arready_r           <= 1'b0;
            arv_arr_flag        <= 1'b0;
        end 
        else begin
            if(arvalid && !awv_arw_flag && !arv_arr_flag) begin
                arready_r       <= (arlen < 8'b1);
                arv_arr_flag    <= (arlen >= 8'b1);
            end
            else if(rvalid_r && rready && arlen_cntr == arlen_r) begin
                arv_arr_flag    <= 1'b0;
                arready_r       <= 1'b1;
            end
            else begin
                arready_r       <= 1'b0;
            end
        end
        $display("arvalid:%d arready:%d arv_arr_flag:%d rdata:0x%x rlast:%d, rid:%d", arvalid, arready_r, arv_arr_flag, rdata, rlast_r, rid_r);
    end


    //r
    always@(posedge aclk) begin
        if(!aresetn) begin
            araddr_r <= 32'b0;
            arlen_cntr <= 8'b0;
            arburst_r <= 2'b0;
            arlen_r   <= 8'b0;
            rlast_r   <= 1'b0;
        end
        else begin
            if(arvalid && !arv_arr_flag) begin
                araddr_r    <= araddr;
                arburst_r   <= arburst;
                arlen_r     <= arlen;
                arsize_r    <= arsize;
                arlen_cntr  <= 8'b0;
                rlast_r     <= (arlen < 8'b1);
                rid_r       <= arid;
            end
            else if((arlen_cntr < arlen_r) && rvalid && rready) begin
                arlen_cntr  <= arlen_cntr + 1'b1;
                rlast_r     <= 1'b0;
                case (arburst_r)
                    2'b01: begin
                        araddr_r <= araddr_r + (1 << arsize_r);
                    end
                default:
                    $display("unsupported burst type:%d", arburst_r);
                endcase
            end
            else if((arlen_cntr == arlen_r) && !rlast_r && arv_arr_flag) begin
                    rlast_r <= 1'b1; 
            end
            else if(arready) begin
                    rlast_r   <= 1'b0;
            end
        end
    end
    
    always@(posedge aclk) begin
        if(!aresetn) begin
            rvalid_r = 1'b0;
            rresp_r  = 2'b0;
        end
        else begin
            if(arvalid && !arv_arr_flag) begin
                dci_pmem_read({32'b0, araddr}, rdata, 8'HFF);
                rvalid_r    = 1'b1;
            end
            else if(arv_arr_flag) begin
                dci_pmem_read({32'b0, araddr_r}, rdata, 8'HFF);
                rvalid_r    = 1'b1;
                rresp_r     = 2'b0;
            end
            else if(rvalid_r && rready) begin
                rvalid_r    = 1'b0;
            end
        end
    end


    //aw
    always@(posedge aclk) begin
        if(!aresetn) begin
            awready_r <= 1'b1;
            awaddr_r <= 32'b0;
            awv_arw_flag <= 1'b0;
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