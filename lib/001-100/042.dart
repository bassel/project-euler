/*
*   The nth term of the sequence of triangle numbers is given by, 
*   t(n) = 0.5 * n(n+1); so the first ten triangle numbers are:
*   
*   1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
*   
*   By converting each letter in a word to a number corresponding to its 
*   alphabetical position and adding these values we form a word value. 
*   For example, the word value for SKY is 19 + 11 + 25 = 55 = t(10). If the 
*   word value is a triangle number then we shall call the word a triangle word.
*   
*   Using 042.txt, a 16K text file containing nearly two-thousand common 
*   English words, how many are triangle words?
*/

import 'dart:io';
import 'dart:math';

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

void solution() {
  final file = File('./assets/001-100/042.txt');
  final content = file.readAsStringSync();

  /// 1. Read words
  final words = content.replaceAll('"', '').split(',');

  /// 2. Compute their word values
  final wordValues = words.map(wordValue);

  /// 3. Now we need to generate the triangle numbers. To know where to stop,
  ///    we check for the largest word value we have
  final maxWordValue = wordValues.reduce(max);

  /// 4. We use a set since order isn't important and lookup is faster
  final triangleValues = <int>{1};
  var n = 2;
  var last = 1;
  while (last < maxWordValue) {
    last += n;
    n++;
    triangleValues.add(last);
  }

  /// 5. Now we just count
  var count = 0;
  for (final val in wordValues) {
    if (triangleValues.contains(val)) count++;
  }
  print('There are $count triangle words');
}

const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
final alphaIndex = {
  for (var i = 0; i < alphabet.length; i++) alphabet[i]: i + 1,
};

int wordValue(String s) {
  return s.split('').map((c) => alphaIndex[c]).reduce((a, b) => a! + b!)!;
}
