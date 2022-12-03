import 'package:flutter/material.dart';
import 'package:flutter_application_2/view_model/home_view_model.dart';
import 'package:flutter_application_2/widgets/rounded_arrow_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    int counter = homeViewModel.counter;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(child: Text("Welcome")),
          Container(
            height: 250,
            child: SvgPicture.asset(
              "assets/welcome.svg",
            ),
          ),
          RoundedArrowButton()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: homeViewModel.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
