import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/navigation_menu.dart';
import 'package:flutter_application_2/view/page_cardio_view.dart';

class PageFive extends StatelessWidget {
  const PageFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavMenu(),
      appBar: AppBar(
        title: Text('Page Five'),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text('Go'),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PageCardioView()));
        },
      )),
    );
  }
}
