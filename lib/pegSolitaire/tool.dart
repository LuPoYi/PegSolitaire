import 'package:flutter/material.dart';

class Tool extends StatelessWidget {
  final Function resetHandler;
  final int currentX;
  final int currentY;
  final int remainingSpot;

  Tool(
      {@required this.resetHandler,
      this.currentX,
      this.currentY,
      this.remainingSpot});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          FlatButton(
            onPressed: resetHandler,
            color: Colors.blue,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[Icon(Icons.dashboard), Text("Reset")],
            ),
          ),
        ]),
        Text("Spot: $remainingSpot"),
      ],
    );
  }
}
