import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/input_module_view.dart';
import 'package:flutter_application_2/view/listModuleExercise.dart';
import 'package:flutter_application_2/view/profile_view.dart';
import 'package:flutter_application_2/widgets/navigation_menu.dart';

class PageWorkoutView extends StatefulWidget {
  const PageWorkoutView({Key? key}) : super(key: key);

  @override
  _PageWorkoutViewState createState() => _PageWorkoutViewState();
}

class _PageWorkoutViewState extends State<PageWorkoutView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // length = tab sayisi
      length: 2,
      child: Scaffold(
        drawer: const NavMenu(),
        appBar: AppBar(
          title: Text(
            "Antrenman Sayfası",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              //tablerin isimleri
              Tab(text: "Antrenman Sayfası Tab 1"),
              Tab(text: "Antrenman Sayfası Tab 2"),
              Tab(text: "Antrenman Sayfası Tab 3")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Sayfa iceriklerini widget olarak olusturup childerenlara ekleyin.
            ListModuleExercise(),
            ProfileView(),
            Container()
          ],
        ),
      ),
    );
  }
}
