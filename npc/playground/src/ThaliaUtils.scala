package ThaliaUtils

import scala.language.implicitConversions
import chisel3._
import chisel3.util._

package object util{

    object SEXT{
        def apply(a: UInt, len: Int) = {
            val alen = a.getWidth
            val signBit = a(alen-1)
            if(alen >= len) a(len-1, 0)
            else Cat(Fill(len - alen, signBit), a)
        }
    }
    
    implicit def uintToBitPat(x: UInt): BitPat = BitPat(x)
}

