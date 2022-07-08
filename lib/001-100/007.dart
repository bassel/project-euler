/*
*   By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
*   we can see that the 6th prime is 13.
*   
*   What is the 10001st prime number?
*/

import '../helpers/measure_runtime.dart';
import '../helpers/int_extensions.dart';

void main() {
  executeAndMeasure(() => solveFor(6));
  executeAndMeasure(() => solveFor(10001));
  executeAndMeasure(() => solveWithoutExtraSpace(10001));
}

/// Brute for is simple but could be time consuming... I'll try it though
void solveFor(int limit) {
  var index = 2;
  var number = 3;

  /// This is a time vs space one, I'm storing the primes so that I don't loop
  /// over all numbers every time I want to check if a number is prime
  final primes = <int>[2];

  while (index <= limit) {
    while (primes.any((p) => number % p == 0)) {
      // not a prime
      number += 2;
    }
    primes.add(number);
    index++;
  }

  print('The ${limit}th prime number is: $number');
}

/// I was definitely wrong about extra space.. Glad I tried this approach too.
/// This one is dramatically faster (10ms vs 755ms)
void solveWithoutExtraSpace(int limit) {
  var index = 2;
  var number = 1;

  while (index <= limit) {
    number += 2;
    while (!number.isPrime) {
      number += 2;
    }
    index++;
  }

  print('The ${limit}th prime number is: $number');
}

/*
*   Overview: https://projecteuler.net/overview=007
*
*   They had some extra improvements on the isPrime function, but their solution
*   is nearly identical to [solveWithoutExtraSpace]
*/
