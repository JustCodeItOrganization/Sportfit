import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/timer_view.dart';
import 'package:flutter_application_2/widgets/navigation_menu.dart';

class PageCardioView extends StatefulWidget {
  const PageCardioView({Key? key}) : super(key: key);

  @override
  _PageCardioViewState createState() => _PageCardioViewState();
}

class _PageCardioViewState extends State<PageCardioView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SportFit",
      home: Scaffold(
          drawer: const NavMenu(),
          appBar: AppBar(
            title: const Text(
              "Kardiyo",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: Center(child: TimerView())),
    );
  }
}
