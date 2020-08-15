import 'package:flutter/material.dart';

class Tool extends StatelessWidget {
  final Function resetHandler;

  Tool({@required this.resetHandler});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          FlatButton(
            shape: CircleBorder(),
            onPressed: resetHandler,
            color: Colors.blue,
            textColor: Colors.white,
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.refresh,
              size: 24,
            ),
          ),
        ]),
      ],
    );
  }
}
