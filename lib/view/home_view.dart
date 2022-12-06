import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/NavMenu.dart';
import 'package:flutter_application_2/view/pageone.dart';
import 'package:flutter_application_2/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    int counter = homeViewModel.counter;

    return Scaffold(
      drawer: NavMenu(),
      appBar: AppBar(
        title: Text('Giris Sayfası'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go'),
          onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => PageOne())
            );
          },
          ) 
        ),
    );
  }
}
