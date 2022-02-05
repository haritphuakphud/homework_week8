// ignore_for_file: avoid_print

import 'dart:io';
import 'game.dart';

void main() {
  var playAgain = true;

  do {
    playGame();

    var YesorNo = false;
    do {
      stdout.write('Play again? (Y/N) : ');
      var inputAnswer = stdin.readLineSync();
      if ((inputAnswer == 'Y' || inputAnswer == 'y' || inputAnswer == 'N' ||
          inputAnswer == 'n')) {
        YesorNo = true;

        if (inputAnswer == 'N' || inputAnswer =='n') {
          playAgain = false;
          print("\nYou have played a total of ${Game().getRound.length} rounds of the game.");
          for(int i = 0; i < Game().getRound.length; i++){
            print('Round${i+1}: ${Game().getRound[i]} guesses.');

          }
          print('╔════════════════════════════════════════');
          print('║               THANK YOU                ');
          print('╟────────────────────────────────────────');

        }
      }
    } while (!YesorNo);
  } while (playAgain);
}
}

void playGame() {
  stdout.write('Enter a maximum number to random : ');
  var maximumInput = int.tryParse(stdin.readLineSync()!);
  dynamic game;
  if(maximumInput != null) {
    game = Game(maxRandom: maximumInput);
  }
  else{
    game = Game();
  }
  var isCorrect = false;

  print('╔════════════════════════════════════════');
  print('║            GUESS THE NUMBER            ');
  print('╟────────────────────────────────────────');

  do {
    int maxRandom = game.getMaxRandom;
    stdout.write('║ Guess the number between 1 and $maxRandom : ');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    if (guess == null) {
      continue;
    }

    var result = game.doGuess(guess);
    if (result == 1) {
      print('║ ➜ $guess is TOO HIGH! ▲');
      print('╟────────────────────────────────────────');
    } else if (result == -1) {
      print('║ ➜ $guess is TOO LOW! ▼');
      print('╟────────────────────────────────────────');
    } else {
      var guessCount = game.getCount;
      print('║ ➜ $guess is CORRECT ❤, total guesses: $guessCount');
      print('╟────────────────────────────────────────');
      isCorrect = true;
    }
  } while (!isCorrect);

  print('║                 THE END                ');
  print('╚════════════════════════════════════════');
}
