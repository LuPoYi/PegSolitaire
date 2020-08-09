import 'package:flutter/material.dart';
import './pegSolitaire/board.dart';
import './pegSolitaire/tool.dart';
import './pegSolitaire/finish.dart';
import 'dart:math';

class PegSolitaire extends StatefulWidget {
  PegSolitaire({Key key}) : super(key: key);

  @override
  _PegSolitaireState createState() => _PegSolitaireState();
}

class _PegSolitaireState extends State<PegSolitaire> {
  int currentX = 0;
  int currentY = 0;
  int remainingSpot = 36;
  bool isFinish = false;

  static List<List<dynamic>> originBoard = [
    [null, null, 1, 1, 1, null, null],
    [null, 1, 1, 1, 1, 1, null],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 0, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [null, 1, 1, 1, 1, 1, null],
    [null, null, 1, 1, 1, null, null],
  ];

  // static List<List<dynamic>> originBoard = [
  //   [null, null, 0, 0, 0, null, null],
  //   [null, 0, 0, 0, 0, 0, null],
  //   [0, 0, 0, 0, 0, 0, 1],
  //   [0, 0, 0, 0, 1, 1, 0],
  //   [0, 0, 0, 0, 0, 0, 1],
  //   [null, 0, 0, 0, 0, 1, null],
  //   [null, null, 0, 1, 1, null, null],
  // ];

  List<List<dynamic>> board =
      originBoard.map((item) => item.map((sub) => sub).toList()).toList();

  List<List<Color>> boardColor = originBoard
      .map((arr) => arr
          .map((item) => item == null ? Colors.white : getRandomColor())
          .toList())
      .toList();

  void _restartBoard() {
    setState(() {
      board =
          originBoard.map((item) => item.map((sub) => sub).toList()).toList();

      boardColor = originBoard
          .map((arr) => arr
              .map((item) => item == null ? Colors.white : getRandomColor())
              .toList())
          .toList();

      remainingSpot = 36;
      isFinish = false;
    });
  }

  void _targetSpot(int x, int y) {
    setState(() {
      if (board[x][y] == 1) {
        // change target
        currentX = x;
        currentY = y;
      } else if (board[x][y] == 0) {
        // try to score
        if ((currentX - x).abs() == 2 &&
            currentY == y &&
            board[((currentX + x) ~/ 2)][y] == 1) {
          boardColor[x][y] = boardColor[currentX][currentY];
          board[currentX][currentY] = 0;
          board[((currentX + x) ~/ 2)][y] = 0;
          board[x][y] = 1;
          currentX = x;
          currentY = y;
          remainingSpot--;
          _checkIsFinish();
        } else if ((currentY - y).abs() == 2 &&
            currentX == x &&
            board[x][((currentY + y) ~/ 2)] == 1) {
          boardColor[x][y] = boardColor[currentX][currentY];
          board[currentX][currentY] = 0;
          board[x][((currentY + y) ~/ 2)] = 0;
          board[x][y] = 1;
          currentX = x;
          currentY = y;
          remainingSpot--;
          _checkIsFinish();
        }
      }
    });
  }

  void _checkIsFinish() {
    // check right and down
    for (int i = 0; i < 7; i++) {
      for (int j = 0; j < 7; j++) {
        if (board[i][j] == null || board[i][j] == 0) {
          continue;
        }

        if ((i > 2 && board[i - 1][j] == 1 && board[i - 2][j] == 0) ||
            (i < 5 && board[i + 1][j] == 1 && board[i + 2][j] == 0) ||
            (j > 2 && board[i][j - 1] == 1 && board[i][j - 2] == 0) ||
            (j < 5 && board[i][j + 1] == 1 && board[i][j + 2] == 0)) {
          return;
        }
      }
    }

    isFinish = true;
    return;
  }

  static Color getRandomColor() {
    return Color.fromARGB(200, Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Column(children: <Widget>[
        SizedBox(height: 36.0),
        AspectRatio(
            aspectRatio: 1,
            child: Container(
                width: double.maxFinite,
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Board(
                      currentX: currentX,
                      currentY: currentY,
                      board: board,
                      boardColor: boardColor,
                      spotHandler: _targetSpot,
                    )))),
        SizedBox(height: 24.0),
        // Tool
        Tool(
            resetHandler: _restartBoard,
            currentX: currentX,
            currentY: currentY,
            remainingSpot: remainingSpot),
        SizedBox(height: 12.0),
        isFinish ? Finish(newGameHandler: _restartBoard) : Container()
      ])
    ]);
  }
}
