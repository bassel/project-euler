/*
*   Using 022.txt, a 46K text file containing over five-thousand first names,
*   begin by sorting it into alphabetical order. Then working out the 
*   alphabetical value for each name, multiply this value by its alphabetical 
*   position in the list to obtain a name score.
* 
*   For example, when the list is sorted into alphabetical order, COLIN, 
*   which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. 
*   So, COLIN would obtain a score of 938 × 53 = 49714.
* 
*   What is the total of all the name scores in the file?
*/

import 'dart:io';

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

/// Proposed solution idea
void solution() {
  final file = File('./assets/001-100/022.txt');
  final content = file.readAsStringSync();
  final names = content.replaceAll('"', '').split(',');
  names.sort((a, b) => a.compareTo(b));
  var total = 0;
  for (var i = 1; i <= names.length; i++) {
    total += alphabetValue(names[i - 1]) * i;
  }
  print('The total is: $total');
}

const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
final charScores = {
  for (var i = 1; i <= alphabet.length; i++) alphabet[i - 1]: i,
};

int alphabetValue(String name) {
  return name.split('').map((e) => charScores[e]!).reduce((a, b) => a + b);
}

/*
*   Overview: https://projecteuler.net/overview=xxx
*
*   Comments after reading the overview
*/
