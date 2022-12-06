import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/exercise_view.dart';
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
      length: 1,
      child: Scaffold(
        drawer: const NavMenu(),
        appBar: AppBar(
          title: Text("Workout"),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              //tablerin isimleri
              Tab(text: "Workout"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Sayfa iceriklerini widget olarak olusturup childerenlara ekleyin.
            ExerciseView()
          ],
        ),
      ),
    );
  }
}
