import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/navigation_menu.dart';
import 'package:flutter_application_2/view/input_module_view.dart';

class PageHomeView extends StatefulWidget {
  const PageHomeView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<PageHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavMenu(),
      appBar: AppBar(
        title: const Text(
          "SportFit",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 200,
              height: 200,
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 100),
              //alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/Sporfit.png'),
                  ),
                  shape: BoxShape.circle,
                  color: Colors.red,
                  border: Border.all(width: 15, color: Colors.blue),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 5,
                      blurRadius: 20,
                    ),
                  ]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: Text(
                "SportFit",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ]),
    );
  }
}

class StandardPageColor {
  static Color headline5Color = Colors.yellow;
}
