import chisel3._
import chisel3.util._

class CSR extends Module{
    val io = IO(new Bundle{
        val writeEn   = Input(Bool())
        val writeAddr = Input(UInt(12.W))
        val writeData = Input(UInt(64.W))
        val readAddr  = Input(UInt(12.W))
        val readData  = Output(UInt(32.W))
    })

    val mstatus = RegInit(0.U(64.W))
    val mtvec   = RegInit(0.U(64.W))
    val mepc    = RegInit(0.U(64.W))
    val mcause  = RegInit(0.U(64.W))

    io.readData := 0.U
    switch(io.readAddr){
        is (0x300.U){   io.readData :=  mstatus }
        is (0x305.U){   io.readData :=  mtvec   }
        is (0x341.U){   io.readData :=  mepc    }
        is (0x342.U){   io.readData :=  mcause  }
    }

    when(io.writeEn){
        switch(io.writeAddr){
            is (0x300.U){   mstatus :=  io.writeData}
            is (0x305.U){   mtvec   :=  io.writeData}
            is (0x341.U){   mepc    :=  io.writeData}
            is (0x342.U){   mcause  :=  io.writeData}            
        }
    }
}