/*
*   You are given the following information, but you may prefer to do
*   some research for yourself.
*   
*   1 Jan 1900 was a Monday.
*   Thirty days has September,
*   April, June and November.
*   All the rest have thirty-one,
*   Saving February alone,
*   Which has twenty-eight, rain or shine.
*   And on leap years, twenty-nine.
*
*   A leap year occurs on any year evenly divisible by 4, but not on a century 
*   unless it is divisible by 400.
* 
*   How many Sundays fell on the first of the month during the twentieth 
*   century (1 Jan 1901 to 31 Dec 2000)?
*/

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

/// I'll just use dates...
void solution() {
  var count = 0;
  var date = DateTime(1900, 1, 7); // first sunday
  while (date.year < 2001) {
    if (date.year > 1900 && date.day == 1) count++;
    date = date.add(Duration(days: 7));
  }
  print('There were $count Sundays in that duration');
}
