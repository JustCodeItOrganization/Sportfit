import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/NavMenu.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavMenu(),
      appBar: AppBar(
        title: Text('Page Two'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go'),
          onPressed: () {
            Navigator.pop(context);
          },
          ) 
        ),
    );
  }
}