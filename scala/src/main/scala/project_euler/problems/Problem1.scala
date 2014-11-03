package project_euler.problems

/**
  * If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
  * The sum of these multiples is 23.
  *
  * Find the sum of all the multiples of 3 or 5 below 1000.
  */
class Problem1 {
  def calculate(number:Int):Int = {
    (1 to number - 1).filter(i => i % 3 == 0 || i % 5 == 0).sum
  }

  def execute():Int = {
    calculate(1000)
  }
}