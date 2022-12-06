import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/NavMenu.dart';
import 'package:flutter_application_2/view/pageProfile.dart';
import 'package:flutter_application_2/view/pageDiet.dart';
import 'package:flutter_application_2/view/pageCardio.dart';


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
            MaterialPageRoute(builder: (context) => pageCardio())
            );
          },
          ) 
        ),
    );
  }
}