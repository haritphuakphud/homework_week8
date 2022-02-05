import 'dart:math';

// ignore_for_file: avoid_print

class Game {
  static dynamic _maxRandom;
  static final List<int> _round = [];
  int? _answer;
  int _guessCount = 0;

  Game({int maxRandom = 100}) {
    var r = Random();
    _setMaxRandom = maxRandom;
    _answer = r.nextInt(maxRandom) + 1;
  }

  int doGuess(int num) {
    _doCount();
    if (_answer! == num) {
      return 0;
    } else if (_answer! < num) {
      return 1;
    } else {
      return -1;
    }
  }

  int get getMaxRandom {
    return _maxRandom;
  }

  _doCount() {
    _guessCount++;
  }

  set _setMaxRandom(int info) {
    _maxRandom = info;
  }

  _doRound(int info) {
    _round.add(info);
  }

  List<int> get getRound {
    return _round;
  }

  int get getCount {
    _doRound(_guessCount);
    return _guessCount;
  }
}
