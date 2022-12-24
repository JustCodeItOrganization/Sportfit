import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/exercise_list.dart';
import 'package:flutter_application_2/widgets/navigation_menu.dart';
import 'package:flutter_application_2/view/page_cardio_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {

  List<Map<String, dynamic>> _itemsPazartesi = [];
  List<Map<String, dynamic>> _itemsSali = [];
  List<Map<String, dynamic>> _itemsCarsamba = [];
  List<Map<String, dynamic>> _itemsPersembe = [];
  List<Map<String, dynamic>> _itemsCuma = [];
  List<Map<String, dynamic>> _itemsCumartesi = [];
  List<Map<String, dynamic>> _itemsPazar = [];

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
            ExerciseList(_itemsPazartesi, "exerciseBoxPazartesi"),
            ExerciseList(_itemsSali, "exerciseBoxSali"),
            ExerciseList(_itemsCarsamba, "exerciseBoxCarsamba"),
            ExerciseList(_itemsPersembe, "exerciseBoxPersembe"),
            ExerciseList(_itemsCuma, "exerciseBoxCuma"),
            ExerciseList(_itemsCumartesi, "exerciseBoxCumartesi"),
            ExerciseList(_itemsPazar, "exerciseBoxPazar"),
          ],
        ),
      ),
    );
  }
}