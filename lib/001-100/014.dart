/*
*   The following iterative sequence is defined for the set of positive integers:
*   
*   n → n/2 (n is even)
*   n → 3n + 1 (n is odd)
*   
*   Using the rule above and starting with 13, we generate the following sequence:
*   
*   13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
*
*   It can be seen that this sequence (starting at 13 and finishing at 1) 
*   contains 10 terms. Although it has not been proved yet (Collatz Problem), 
*   it is thought that all starting numbers finish at 1.
*   
*   Which starting number, under one million, produces the longest chain?
*   
*   NOTE: Once the chain starts the terms are allowed to go above one million.
*/

import 'dart:collection';
import 'dart:math';

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

/// A few observations:
///   * Once we reach a power of 2, the length of the rest of the chain is log(n)
///   * Chain(n) = ... + Chain(x). If we reach an x that we already went over,
///     we don't need to keep going with the chain. So memoizing the chain
///     lengths is definitely useful
void solution() {
  const max = 1000000;

  final computedChains = HashMap<int, int>();

  /// Prepopulate cache with the powers of 2
  final log2 = log(2);
  var val = 2;
  while (val < max) {
    computedChains[val] = log(val) ~/ log2 + 1;
    val *= 2;
  }

  var n = 1;
  var longestChain = 0;
  var chainStarter = 0;

  while (n < max) {
    var chain = 1;
    var next = f(n);
    while (next > 1) {
      if (computedChains.containsKey(next)) {
        chain += computedChains[next]!;
        break;
      } else {
        chain++;
        next = f(next);
      }
    }

    if (chain > longestChain) {
      longestChain = chain;
      chainStarter = n;
    }

    n++;
  }

  print('Longest chain length: $longestChain');
  print('Chain starts at $chainStarter');
}

/// Sequence function
int f(int n) {
  if (n.isEven) return n ~/ 2;
  return 3 * n + 1;
}

/*
*   Overview: https://projecteuler.net/overview=014
*
*   Seems like I caught this one. There was one extra optimization that could've
*   been done, but overall I'm satisfied with what I got.
*/
