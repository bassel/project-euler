/*
*   A permutation is an ordered arrangement of objects. For example, 3124 is 
*   one possible permutation of the digits 1, 2, 3 and 4. If all of the 
*   permutations are listed numerically or alphabetically, we call it 
*   lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
*
*   012   021   102   120   201   210
*
*   What is the millionth lexicographic permutation of the 
*   digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
*/

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

/// This is more of a mathematical problem. Without generating all the
/// permutations, we can know exactly how many we can get that start with 0.
/// If it's less than a million, we skip that and move on to the permutations
/// starting with 1. We keep going until we get close to a million, then we
/// start filling the next digits and doing the calculations.
void solution() {
  final digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  const targetIndex = 1000000;

  var permutationsSoFar = 1;
  var possibilities = digits.length - 1;
  final chosen = <int>[];
  while (permutationsSoFar < targetIndex) {
    final possiblePermutations = factorial(possibilities);
    final fixedDigitIndex =
        (targetIndex - permutationsSoFar) ~/ possiblePermutations;
    permutationsSoFar += fixedDigitIndex * possiblePermutations;
    chosen.add(digits.removeAt(fixedDigitIndex));
    possibilities--;
  }
  print('Target permutation is ${chosen.join('')}${digits.join('')}');
}

int factorial(int n) {
  var product = 1;
  for (var i = n; i > 1; i--) {
    product *= i;
  }
  return product;
}
