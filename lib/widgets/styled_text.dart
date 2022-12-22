import 'package:flutter/material.dart';

class StyledText extends StatelessWidget{
  String text;
  StyledText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: const EdgeInsets.all(30.0),
       padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      child: Text(text)
    );
  }
}