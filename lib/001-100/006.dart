/*
*   The sum of the squares of the first ten natural numbers is:
*             1^2 + 2^2 + ... + 10^2 = 385 
*   The square of the sum of the first ten natural numbers is:
*             (1 + 2 + ... + 10)^2 = 3025
*
*   Hence the difference between the sum of the squares of the first ten 
*   natural numbers and the square of the sum is: 3025 - 385 = 2640
*
*   Find the difference between the sum of the squares of the first one 
*   hundred natural numbers and the square of the sum.
*/

import 'dart:math';

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

/// This looks like a mathematical problem, no need to brute force it.
/// We just need to find the proper formula and get the answer in O(1)
void solution() {
  print('Answer for 10: ${solveFor(10)}');
  print('Answer for 100: ${solveFor(100)}');
}

int solveFor(int limit) {
  /// 1. sum of squares = sum(i^2) for i = 1 to n
  ///                   = (n)(n + 1)(2n + 1) / 6
  final sumOfSquares = limit * (limit + 1) * (2 * limit + 1) / 6;

  /// 2. square of sums = (sum(i) for i = 1 to n) ^ 2
  ///                   = ((n)(n + 1) / 2) ^ 2
  final squareOfSum = pow((limit * (limit + 1) / 2), 2);

  return (squareOfSum - sumOfSquares).toInt();
}

/*
*   Overview: https://projecteuler.net/overview=006
*
*   This was super easy
*/
