import 'package:flutter/material.dart';

class RoundedArrowButton extends StatelessWidget {
  const RoundedArrowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      color: Colors.blue,
      textColor: Colors.white,
      child: Icon(
        Icons.arrow_right_alt_sharp,
        size: 24,
      ),
      padding: EdgeInsets.all(16),
      shape: CircleBorder(),
    );
  }
}
