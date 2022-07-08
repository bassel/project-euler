/*
*   A palindromic number reads the same both ways. The largest palindrome made 
*   from the product of two 2-digit numbers is 9009 = 91 × 99.
*
*   Find the largest palindrome made from the product of two 3-digit numbers.
*/

void main() {
  /// Let's start with the largest two 3-digit numbers
  var a = 999;
  var b = 999;

  /// The bruteforce solution is simple, but has a runtime of O(N^2).

  var largestPalindrome = 0;

  /// We only reach 100 since that's the smallest 3 digits number
  for (var i = a; i >= 100; i--) {
    for (var j = b; j >= 100; j--) {
      final result = i * j;
      if (isPalindrome(result) && result > largestPalindrome) {
        largestPalindrome = result;
      }
    }
  }

  print('Largest palindrome: $largestPalindrome');
}

bool isPalindrome(int n) {
  return '$n' == '$n'.split('').reversed.join();
}

/*
*   Overview: https://projecteuler.net/overview=003
*
*   A few optimizations were possible - This was a good learning experience
*/
