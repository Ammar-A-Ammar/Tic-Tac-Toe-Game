// ignore_for_file: avoid_print

import 'dart:io';

main() {
  int playerTurn = 2;
  Map<String, int> positions = {
    'TopLeft': 0,
    'TopCenter': 0,
    'TopRight': 0,
    'CenterLeft': 0,
    'Center': 0,
    'CenterRight': 0,
    'BottomLeft': 0,
    'BottomCenter': 0,
    'BottomRight': 0
  };
  Map<String, String> pos = {
    'TopLeft': ' ',
    'TopCenter': ' ',
    'TopRight': ' ',
    'CenterLeft': ' ',
    'Center': ' ',
    'CenterRight': ' ',
    'BottomLeft': ' ',
    'BottomCenter': ' ',
    'BottomRight': ' '
  };

  print('Welcome to Tic Tac Toe Game');
  bool again = true;
  int player1score = 0;
  int player2score = 0;
  while (again) {
    do {
      //Start of the game
      playerTurn = playerTurn == 1 ? 2 : 1;
      //bool again = false;

      //check if the game is over by modifying the isGameOver method, If not switch turns repeat the same code till it ends // DONE
      // if (isGameOver(pos)) {
      //   print(' $playerTurn is the winner in this game');
      //   print("The score is $player1score for player 1 and $player2score for player 2");
      //
      // }
      // else {
      //   //playerTurn = playerTurn == 1 ? 2 : 1;
      //   //print('Pick position to place your mark');
      // };

      // display mark on the spaces between the columns based on which places filled and which player filled them // DONE
      String mark = '';
      mark = (playerTurn == 1) ? 'X' : 'O';
/*
  print('---------');
  print('|   |   |');
  print('---------');
  print('|   |   |');
  print('---------');
  print('|   |   |');
  print('---------');
*/
      board(pos);

      print("Player $playerTurn's turn");
      print('Pick position to place your mark');

      //int laps = 0;
      for (int i = 0; i < 9; i++) {
        if (pos.values.elementAt(i) != " ") {
          continue;
        }
        //laps++;
        print('${i + 1}: ${pos.keys.elementAt(i)}');
      }

      // Getting input from user on which position he wants to place his mark
      int? n = int.parse(stdin.readLineSync()!);

      if (n > 9) {
        print("That's a wrong number");
        playerTurn = playerTurn == 1 ? 2 : 1;
      } else {
        // Check the position and apply his mark (x or o based on whose turn on that position // DONE
        if (n == 1 && pos['TopLeft'] == ' ') {
          pos['TopLeft'] = mark;
        } else if (n == 2 && pos['TopCenter'] == ' ') {
          pos['TopCenter'] = mark;
        } else if (n == 3 && pos['TopRight'] == ' ') {
          pos['TopRight'] = mark;
        } else if (n == 4 && pos['CenterLeft'] == ' ') {
          pos['CenterLeft'] = mark;
        } else if (n == 5 && pos['Center'] == ' ') {
          pos['Center'] = mark;
        } else if (n == 6 && pos['CenterRight'] == ' ') {
          pos['CenterRight'] = mark;
        } else if (n == 7 && pos['BottomLeft'] == ' ') {
          pos['BottomLeft'] = mark;
        } else if (n == 8 && pos['BottomCenter'] == ' ') {
          pos['BottomCenter'] = mark;
        } else if (n == 9 && pos['BottomRight'] == ' ') {
          pos['BottomRight'] = mark;
        } else {
          print(" Invalid move ");
          playerTurn = playerTurn == 1 ? 2 : 1;
        }
      }

      //TODO: print which player won and keep score of games between the two players

    } while (isGameOver(pos) == 0);

    board(pos);
    if (isGameOver(pos) == 1) {
      print("Player $playerTurn is the winner");
      (playerTurn == 1) ? player1score += 1 : player2score += 1;
    } else if (isGameOver(pos) == -1) {
      print("it's a Draw !!");
    }

    pos = {
      'TopLeft': ' ',
      'TopCenter': ' ',
      'TopRight': ' ',
      'CenterLeft': ' ',
      'Center': ' ',
      'CenterRight': ' ',
      'BottomLeft': ' ',
      'BottomCenter': ' ',
      'BottomRight': ' '
    };
    print("Do you want to play again ?, if Yes type 'Y', if No type anything");
    String againInput = (stdin.readLineSync()!);
    if (againInput != "Y") {
      again = false;
      print(
          "The winner of all matches is ${player1score == player2score ? "" : "player"} ${player1score > player2score ? "player 1" : player2score > player1score ? "player 2" : "no one :)"}");
    } else {
      pos = {
        'TopLeft': ' ',
        'TopCenter': ' ',
        'TopRight': ' ',
        'CenterLeft': ' ',
        'Center': ' ',
        'CenterRight': ' ',
        'BottomLeft': ' ',
        'BottomCenter': ' ',
        'BottomRight': ' '
      };
    }
  }
}

int isGameOver(positions) {
  if (positions.values.elementAt(0) == positions.values.elementAt(1) &&
      positions.values.elementAt(0) == positions.values.elementAt(2) &&
      positions.values.elementAt(0) != ' ') {
    return 1;
  } else if (positions.values.elementAt(3) == positions.values.elementAt(4) &&
      positions.values.elementAt(3) == positions.values.elementAt(5) &&
      positions.values.elementAt(3) != ' ') {
    return 1;
  } else if (positions.values.elementAt(6) == positions.values.elementAt(7) &&
      positions.values.elementAt(6) == positions.values.elementAt(8) &&
      positions.values.elementAt(6) != ' ') {
    return 1;
  } else if (positions.values.elementAt(0) == positions.values.elementAt(3) &&
      positions.values.elementAt(0) == positions.values.elementAt(6) &&
      positions.values.elementAt(0) != ' ') {
    return 1;
  } else if (positions.values.elementAt(1) == positions.values.elementAt(4) &&
      positions.values.elementAt(1) == positions.values.elementAt(7) &&
      positions.values.elementAt(1) != ' ') {
    return 1;
  } else if (positions.values.elementAt(2) == positions.values.elementAt(5) &&
      positions.values.elementAt(2) == positions.values.elementAt(8) &&
      positions.values.elementAt(2) != ' ') {
    return 1;
  } else if (positions.values.elementAt(0) == positions.values.elementAt(4) &&
      positions.values.elementAt(0) == positions.values.elementAt(8) &&
      positions.values.elementAt(0) != ' ') {
    return 1;
  } else if (positions.values.elementAt(2) == positions.values.elementAt(4) &&
      positions.values.elementAt(2) == positions.values.elementAt(6) &&
      positions.values.elementAt(2) != ' ') {
    return 1;
  } else if (positions.values.elementAt(1) != ' ' &&
      positions.values.elementAt(2) != ' ' &&
      positions.values.elementAt(3) != ' ' &&
      positions.values.elementAt(4) != ' ' &&
      positions.values.elementAt(5) != ' ' &&
      positions.values.elementAt(6) != ' ' &&
      positions.values.elementAt(7) != ' ' &&
      positions.values.elementAt(8) != ' ' &&
      positions.values.elementAt(0) != ' ') {
    return -1;
  } else {
    return 0;
  }
}

void board(pos) {
  print('-------------');
  print(
      '| ${pos.values.elementAt(0)} | ${pos.values.elementAt(1)} | ${pos.values.elementAt(2)}  ');
  print('-------------');
  print(
      '| ${pos.values.elementAt(3)} | ${pos.values.elementAt(4)} | ${pos.values.elementAt(5)}  ');
  print('-------------');
  print(
      '| ${pos.values.elementAt(6)} | ${pos.values.elementAt(7)} | ${pos.values.elementAt(8)}  ');
  print('-------------');
}
