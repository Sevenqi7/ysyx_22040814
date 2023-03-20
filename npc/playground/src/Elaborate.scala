import circt.stage._

object Elaborate extends App {
  def top = new top()
  val useMFC = true // use MLIR-based firrtl compiler
  val generator = Seq(chisel3.stage.ChiselGeneratorAnnotation(() => top))
  if (useMFC) {
    (new ChiselStage).execute(args, generator :+ CIRCTTargetAnnotation(CIRCTTarget.SystemVerilog))
  } else {
    (new chisel3.stage.ChiselStage).execute(args, generator)
  }
}
