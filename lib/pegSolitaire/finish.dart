import 'package:flutter/material.dart';

class Finish extends StatelessWidget {
  final Function newGameHandler;
  Finish({this.newGameHandler});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Good Job!"),
      ],
    );
  }
}
