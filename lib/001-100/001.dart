/*
*   If we list all the natural numbers below 10 that are multiples of 3 or 5, 
*   we get 3, 5, 6 and 9. The sum of these multiples is 23.
*   Find the sum of all the multiples of 3 or 5 below 1000
*/

/// Instead of looping over all integers and checking whether they're divisible
/// by 5 or 3, we go the opposite route and generate those multiples
void main() {
  const target = 1000;
  var sum = 0;

  /// largest multiple of 3 less than 1000
  final largestFor3 = target / 3;
  for (var i = 1; i < largestFor3; i++) {
    sum += i * 3;
  }

  /// largest multiple of 5 less than 1000
  final largestFor5 = target / 5;
  for (var i = 1; i < largestFor5; i++) {
    /// Multiples of both 3 and 5 should be added only once
    if (i % 3 != 0) {
      sum += i * 5;
    }
  }

  print('Sum: $sum');
}

/*
*   Overview: https://projecteuler.net/overview=001
*
*   Turns out there's a way to extract the math formula that gives the answer
*   in O(1) time. NOICE
*/
