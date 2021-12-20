// ignore_for_file: avoid_print
import 'dart:io';
import 'dart:math';

class Game {
  static const maxRandom=100;
  int? answer;
  int counts=0;
  //bool check=true;
  Game()
  {
    var r = Random();
    answer=r.nextInt(maxRandom)+1;
  }
  int doGuess(int i) {
    if (i > answer!) {
      counts++;
      return 1;
    }
    else if (i < answer!) {
      counts++;
      return -1;
    }
    else {
      counts++;
      return 0;
    }
  }
  void Play()
  {
    const maxRandom = 100;
    var game = Game();
    var isCorrect = false;

    print('╔════════════════════════════════════════');
    print('║            GUESS THE NUMBER            ');
    print('╟────────────────────────────────────────');

    for(;;) {
      stdout.write('║ Guess the number between 1 and $maxRandom: ');
      var input = stdin.readLineSync();
      var guess = int.tryParse(input!);
      if (guess == null) {
        continue;
      }
      var result = game.doGuess(guess);
      var count = game.counts;

      if (result == 1) {
        print('║ ➜ $guess is TOO HIGH! ▲');
        print('╟────────────────────────────────────────');
      } else if (result == -1) {
        print('║ ➜ $guess is TOO LOW! ▼');
        print('╟────────────────────────────────────────');
      } else if (result == 0){
        print('║ ➜ $guess is CORRECT ❤, total guesses: $count');
        print('╟────────────────────────────────────────');
        break;
      }
    }
    print('║                 THE END                ');
    print('╚════════════════════════════════════════');
  }
}