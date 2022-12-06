import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/standard_page_view.dart';

class StandardPageView2 extends StatefulWidget {
  const StandardPageView2({Key? key}) : super(key: key);

  @override
  _StandardPageView2State createState() => _StandardPageView2State();
}

class _StandardPageView2State extends State<StandardPageView2> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: StandardPage(),
      //body: TabBarView(children: [
      //  Container(color: Colors.red),
      //  Container(color: Colors.red),
      //]),
    );
  }
}









/*
class StandardPage extends StatelessWidget {
  const StandardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
  }
}

class StandardPageColor {
  static Color headline5Color = Colors.yellow;
}

class HomeButtons extends StatelessWidget {
  final String textInButton;
  const HomeButtons({Key? key, required this.textInButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: SizedBox(
        child: ElevatedButton(
          //style: ButtonStyle(
          //style: ElevatedButton.styleFrom(
          //  backgroundColor: Colors.blue,
          //  padding: const EdgeInsets.all(10),
          //),
          //foregroundColor:
          //MaterialStateProperty.all<Color>(Colors.blue),
          //),
          style: ElevatedButton.styleFrom(
              //maximumSize: const Size(50,50),
              //minimumSize: const Size(25,30),
              ),
          onPressed: () {},
          //child: SizedBox(
          //width: 50,
          child: Text(textInButton),
          //),
        ),
      ),
    );
  }
}
*/