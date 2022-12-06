import 'package:flutter/material.dart';

class CardioView extends StatelessWidget {
  const CardioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          margin: EdgeInsets.all(100),
          child: Center(
            child: Text(
              "30",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
          width: 200,
          height: 200,
          decoration:
              const BoxDecoration(color: Colors.blue, shape: BoxShape.circle)),
    );
  }
}
