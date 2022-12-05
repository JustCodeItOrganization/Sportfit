import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/NavMenu.dart';
import 'package:flutter_application_2/view/pagetwo.dart';
import 'package:flutter_application_2/view/pagethree.dart';


class PageFour extends StatelessWidget {
  const PageFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavMenu(),
      appBar: AppBar(
        title: Text('Page Four'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go'),
          onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => PageThree())
            );
          },
          ) 
        ),
    );
  }
}