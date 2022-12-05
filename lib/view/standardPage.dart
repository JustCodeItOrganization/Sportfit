import 'package:flutter/material.dart';

class StandardPage extends StatelessWidget {
  const StandardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'SPORTFIT',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: StandardPageColor.headline5Color),
          ),
        ),
      ),
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: 200,
          height: 200,
          margin: const EdgeInsets.only(top: 75),
          //alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/welcome.png"),
            ),
            shape: BoxShape.circle,
            color: Colors.red,
            border:  Border.all(width: 15, color: Colors.blue),
            boxShadow: const [
              BoxShadow(
                color:Colors.grey,
                spreadRadius: 5,
                blurRadius: 20,
                //offset: Offset(0, 25),
              ),
            ]
          ),
        ),
      ]),
    );
  }
}

class StandardPageColor {
  static Color headline5Color = Colors.yellow;
}
