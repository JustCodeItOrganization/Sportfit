import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/listModuleFood.dart';
import 'package:flutter_application_2/widgets/navigation_menu.dart';
import 'package:hive/hive.dart';

class PageDietView extends StatefulWidget {
  const PageDietView({Key? key}) : super(key: key);

  @override
  _PageDietViewState createState() => _PageDietViewState();
}

class _PageDietViewState extends State<PageDietView> {
  @override
  List<Map<String, dynamic>> items_food = [];

  Widget build(BuildContext context) {
    return DefaultTabController(
      // length = tab sayisi
      length: 1,

      child: Scaffold(
        drawer: const NavMenu(),
        appBar: AppBar(
          title: Text(
            "Diyet Sayfası",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              // tablerin isimleri
              Tab(
                icon: Icon(Icons.food_bank_sharp),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Sayfa iceriklerini widget olarak olusturup childerenlara ekleyin.
            ListModuleFood()
          ],
        ),
      ),
    );
  }
}
