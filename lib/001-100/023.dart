/*
*   A perfect number is a number for which the sum of its proper divisors is 
*   exactly equal to the number. For example, the sum of the proper divisors of 
*   28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
*
*   A number n is called deficient if the sum of its proper divisors is less 
*   than n and it is called abundant if this sum exceeds n.
*
*   As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, 
*   the smallest number that can be written as the sum of two abundant numbers 
*   is 24. By mathematical analysis, it can be shown that all integers greater 
*   than 28123 can be written as the sum of two abundant numbers. However, this 
*   upper limit cannot be reduced any further by analysis even though it is 
*   known that the greatest number that cannot be expressed as the sum of two 
*   abundant numbers is less than this limit.
*
*   Find the sum of all the positive integers which cannot be written as the 
*   sum of two abundant numbers.
*/

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

/// One way is to find the abundant numbers and brute force this
void solution() {
  final abundantNumbers = <int>{};
  var sum = 0;

  for (var i = 1; i < 28123; i++) {
    if (!canBeWrittenAsSumOfAnumdants(i, abundantNumbers)) {
      sum += i;
    }
    if (isAbundant(i)) {
      abundantNumbers.add(i);
    }
  }

  print('The sum is $sum');
}

bool isAbundant(int n) {
  return n < sumOfDivisors(n);
}

int sumOfDivisors(int n) {
  var sum = 0;
  for (var i = 1; i <= n / 2; i++) {
    if (n % i == 0) sum += i;
  }
  return sum;
}

/// All numbers in the set are less than n because of how we're looping, so
/// they're all worth considering
bool canBeWrittenAsSumOfAnumdants(int n, Set<int> abundants) {
  for (final a in abundants) {
    if (abundants.contains(n - a)) {
      return true;
    }
  }
  return false;
}
