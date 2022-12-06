import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  final Color color;
  final Color backgroundColor;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.onClicked,
    this.backgroundColor = Colors.black,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
        onPressed: onClicked,
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: color),
        ));
  }
}
