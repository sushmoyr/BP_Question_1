import 'dart:io';

void main() {
  try {

    List<int> scores = inputScores();

    //Empty array for count sort. Item value limit0 <= item < 1000
    List<int> counter = List.generate(1000, (index) => 0);

    for (int i in scores) {
      counter[i]++;
    }

    int place = 0;
    for (int i=counter.length - 1; i>=0; i--) {
      if (counter[i] != 0) {
        place++;
      }
      if (place == 3) {
        print(i);
        break;
      }
    }
  } catch (e) {
    print(e);
  }
}

List<int> inputScores() {
  String? line = stdin.readLineSync();
  if (line == null) {
    throw Exception('No input. End of line.');
  }

  List<String> segments = line.split(' ');

  List<int> values = [];
  for (String s in segments) {
    if (s.isEmpty) {
      continue;
    }
    int? n = int.tryParse(s);
    if (n==null) {
      throw Exception('Invalid input');
    }
    values.add(n);
  }

  return values;
}
