/*
*   Starting in the top left corner of a 2×2 grid, and only being able to move
*   to the right and down, there are exactly 6 routes to the bottom right corner.
*
*   How many such routes are there through a 20×20 grid?
*/

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(() => solution(2));
  executeAndMeasure(() => solution(20));
}

/// The paths we take an be written as a string. Example for a 2x2 grid:
/// RRDD -- DDRR -- DRRD -- DRDR -- RDDR -- RDRD
///
/// For a grid of dimensions nxn: any path we take must have exactly n down
/// jumps and n right jumps. Therefor the answer is just the number of
/// distinct permutations that we can create out of n "R" chars and n "D" chars
///
/// Total permutations = (2n)! since we have 2n chars
/// we divide that by n!*n! since each char has a frequency of n
///
/// (2n)! / (n!)^2 = (2n)(2n-1)...(n)! / (n!)^2 = (2n)(2n-1)..(n+1)/n!
void solution(int n) {
  num result = 1;

  /// We'll start dividing prematurely to avoid overflowing
  num divideBy = n;
  for (var i = 2 * n; i > n; i--) {
    result *= i;
    result /= divideBy;
    if (divideBy > 1) {
      divideBy--;
    }
  }
  if (divideBy > 1) {
    result /= divideBy;
  }
  print('Solution for a ${n}x$n grid: ${result.ceil()}');
}

/*
*   Overview: https://projecteuler.net/overview=015
*
*   I got on the right track, but could've written it in a better way.
*   I should probably refresh my knowledge of combinations in math
*/
