import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  final int currentX;
  final int currentY;
  final List<List<dynamic>> board;
  final List<List<Color>> boardColor;
  final Function spotHandler;

  Board(
      {@required this.currentX,
      @required this.currentY,
      @required this.board,
      @required this.boardColor,
      @required this.spotHandler});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (int x = 0; x < 7; x++)
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      for (int y = 0; y < 7; y++)
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Visibility(
                                      child: RawMaterialButton(
                                        child: x == currentX && y == currentY
                                            ? Icon(Icons.flag)
                                            : null,
                                        onPressed: () => spotHandler(x, y),
                                        elevation: 2.0,
                                        fillColor: board[x][y] == 0
                                            ? Colors.white
                                            : boardColor[x][y],
                                        highlightColor: Colors.blueAccent,
                                        padding: EdgeInsets.all(0.0),
                                        shape: CircleBorder(),
                                      ),
                                      visible: board[x][y] != null)),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
