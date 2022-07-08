/*
*   The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
*
*   Find the sum of all the primes below two million.
*/

import 'dart:math';

import '../helpers/measure_runtime.dart';
import '../helpers/int_extensions.dart';

void main() {
  executeAndMeasure(bruteForceSolution);
  executeAndMeasure(optimizedSolution);
}

/// Brute force is pretty straightforward, I'll start with that then optimize
/// I have a feeling the sum will overflow though...
///
/// PostRun: it didn't overflow, but took way too much time...
void bruteForceSolution() {
  const limit = 2000000;
  var sum = 2;
  for (var i = 3; i < limit; i += 2) {
    if (i.isPrime) {
      sum += i;
    }
  }
  print('[Brute Force] The sum is: $sum');
}

/// Disclaimer: I did not come up with this. Saw it in the overview and it
/// looked interesting so I wanted to implement it for comparaison
void optimizedSolution() {
  const limit = 2000000;

  /// Sacrificing one bool storage to make indexes easier to work with
  /// just for the sake of readability
  ///
  /// + cross out all evens on generation to avoid needing a loop for it
  final crossedOut = List.generate(limit + 1, (index) => index.isEven);
  final crossLimit = sqrt(limit) + 1;

  for (var i = 3; i <= crossLimit; i += 2) {
    if (!crossedOut[i]) {
      // This is a prime
      for (var j = 2 * i; j < limit; j += i) {
        crossedOut[j] = true;
      }
    }
  }

  /// 2 is a prime, that's established and we no longer want to deal with even
  /// numbers.
  var sum = 2;
  for (var i = 3; i < crossedOut.length; i += 2) {
    if (!crossedOut[i]) {
      sum += i;
    }
  }

  print('[Optimized] The sum is: $sum');
}

/*
*   Overview: https://projecteuler.net/overview=010
*
*   New concept learned:  The sieve of Eratosthenes
*/
