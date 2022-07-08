void executeAndMeasure(void Function() callback) {
  print('-----------------------------');
  final start = DateTime.now();
  callback();
  final end = DateTime.now();
  print(
    'Running time: ${end.difference(start).inMilliseconds} milliseconds',
  );
  print('-----------------------------');
}
