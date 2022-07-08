/*
*   2520 is the smallest number that can be divided by each of the numbers 
*   from 1 to 10 without any remainder.
*
*   What is the smallest positive number that is evenly divisible by all of 
*   the numbers from 1 to 20?
*/

import 'dart:math';
import '../helpers/int_extensions.dart';
import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
  executeAndMeasure(optimizedSolution);
}

/// The first thing that comes to mind is that we'll use the primes and some
/// sort of integer factorization. The number we're looking for is the product
/// of all the (prime ^ largest factor that we get to for that prime)
void solution() {
  // print('Smallest for 10: ${smallestFor(10)}');
  print('Smallest for 20: ${smallestFor(20)}');
  // print('Smallest for 100: ${smallestFor(100)}');
}

int smallestFor(int limit) {
  /// 1. Extract all primes
  final primes = <int, int>{};
  if (limit >= 2) primes[2] = 1;
  for (var i = 3; i <= limit; i += 2) {
    if (i.isPrime) primes[i] = 1;
  }

  /// 2. Loop and factorize
  for (var i = 2; i <= limit; i++) {
    var factorized = i;
    for (final prime in primes.keys) {
      var factors = 0;
      while (factorized % prime == 0) {
        factors++;
        factorized ~/= prime;
      }
      primes.update(prime, (value) => max(factors, value));
    }
  }
  return primes.keys
      .map((e) => pow(e, primes[e]!))
      .reduce((a, b) => a * b)
      .toInt();
}

/// After solving the one above, I got a better idea. Let's see if it gets us
/// somewhere...
void optimizedSolution() {
  // print('Smallest for 10: ${smallestFor(10)}');
  print('Smallest for 20 (optimized): ${smallestFor(20)}');
  // print('Smallest for 100 (optimized): ${smallestFor(100)}');
}

int smallestForOptimized(int limit) {
  /// 1. Extract all primes
  final primes = <int, int>{};
  if (limit >= 2) primes[2] = 1;
  for (var i = 3; i <= limit; i += 2) {
    if (i.isPrime) primes[i] = 1;
  }

  /// 2. Instead of looping and factorizing, we generate that largest factor
  /// we're looking for
  for (final prime in primes.keys) {
    var prod = prime;
    var factors = 1;
    while (prod <= limit) {
      prod *= prime;
      factors++;
    }
    primes[prime] = factors;
  }

  return primes.keys
      .map((e) => pow(e, primes[e]!))
      .reduce((a, b) => a * b)
      .toInt();
}

/*
*   Overview: https://projecteuler.net/overview=005
*
*   Bingo! Got this one too. They did it in a slightly different manner, 
*   but the idea is still the same
*   
*   The difference in runtime is also dramatic, especially if we try larger 
*   numbers (got an integer overflow when I tried 10, but that's a problem
*   for another day)
*/
