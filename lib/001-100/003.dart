/*
*   The prime factors of 13195 are 5, 7, 13 and 29.
* 
*   What is the largest prime factor of the number 600851475143 ?
*/

import 'dart:math' as math;

/// The only optimizations I can think of is to factorize all 2s until the
/// number is odd (which it already is), then loop until sqrt(n)
void main() {
  var n = 600851475143;
  while (n.isEven) {
    n ~/= 2;
  }

  int largestPrimeFactor = 1;
  for (var i = 3; i <= math.sqrt(n); i += 2) {
    if (n % i == 0) {
      largestPrimeFactor = i;
    }

    /// Doing a while here ensures that every number we reach with a modulo
    /// of 0 will be prime, so no need to check that again
    while (n % i == 0) {
      n ~/= i;
    }
  }

  if (n > 1) {
    /// The largest prime factor is actually the remainder
    largestPrimeFactor = n;
  }

  print('Largest prime factor: $largestPrimeFactor');
}

/*
*   Overview: https://projecteuler.net/overview=003
*
*   Seems like there was room for a tiny extra optimization, but the current 
*   code still does the trick
*/
