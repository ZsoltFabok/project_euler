package project_euler.problems

import org.junit.runner.RunWith
import org.scalatest.FunSpec
import org.scalatest.junit.JUnitRunner
import org.scalatest.Matchers


@RunWith(classOf[JUnitRunner])
class Problem1Spec extends FunSpec with Matchers {
  describe ("#calculate") {
    it ("returns 10 for everything") {
      new Problem1().execute should equal(10)
    }
  }
}
