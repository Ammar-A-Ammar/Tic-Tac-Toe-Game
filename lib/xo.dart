import 'dart:io';

main(){
  int playerTurn = 2;
  Map<String , int> positions = {
    'TopLeft': 0,
    'TopCenter' : 0,
    'TopRight' : 0,
    'CenterLeft': 0,
    'Center': 0,
    'CenterRight': 0,
    'BottomLeft': 0,
    'BottomCenter': 1,
    'BottomRight': 0
  };
  print('Welcome to Tic Tac Toe Game');

  //Start of the game
  playerTurn = playerTurn == 1 ? 2 : 1;

  // TODO: display mark on the spaces between the columns based on which places filled and which player filled them
  print(
    '---------'
  );
  print(
    '|   |   |'
  );
  print(
      '---------'
  );
  print(
      '|   |   |'
  );
  print(
      '---------'
  );
  print(
      '|   |   |'
  );
  print(
      '---------'
  );

  print(
    "Player$playerTurn's turn"
  );

  print('Pick position to place your mark');

  int laps = 0;
  for (int i = 0 ; i <9 ; i++){
    if(positions.values.elementAt(i) != 0){
      continue;
    }
    laps++;
    print('$laps: ${positions.keys.elementAt(i)}');
  }

  // Getting input from user on which position he wants to place his mark
  int? n = int.parse(stdin.readLineSync()!);

  if(n > laps){
    print("That's a wrong number");
  }
  else{
    // TODO: Check the position and apply his mark (x or o based on whose turn on that position
  }

  //TODO: check if the game is over by modifying the isGameOver method, If not switch turns repeat the same code till it ends
  isGameOver();

  //TODO: print which player won and keep score of games between the two players
}

bool isGameOver(){
  return false;
}
