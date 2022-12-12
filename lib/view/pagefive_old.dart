import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/exercise_list.dart';
import 'package:flutter_application_2/widgets/navigation_menu.dart';
import 'package:flutter_application_2/view/page_cardio_view.dart';

class PageFive extends StatelessWidget {
  const PageFive({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        drawer: NavMenu(),
        appBar: AppBar(
          title: Text('Page Five'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              //tablerin isimleri
              Tab(text: "Pazartesi"),
              Tab(text: "Sali"),
              Tab(text: "Carsamba"),
              Tab(text: "Persembe"),
              Tab(text: "Cuma"),
              Tab(text: "Cumartesi"),
              Tab(text: "Pazar"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Sayfa iceriklerini widget olarak olusturup childerenlara ekleyin.
            ExerciseList(),
            ExerciseList(),
            ExerciseList(),
            ExerciseList(),
            ExerciseList(),
            ExerciseList(),
            ExerciseList(),
          ],
        ),
      ),
    );
  }
}
