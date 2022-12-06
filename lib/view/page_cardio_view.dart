import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/navigation_menu.dart';

class PageCardioView extends StatefulWidget {
  const PageCardioView({Key? key}) : super(key: key);

  @override
  _PageCardioViewState createState() => _PageCardioViewState();
}

class _PageCardioViewState extends State<PageCardioView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // length = tab sayisi
      length: 2,
      child: Scaffold(
        drawer: const NavMenu(),
        appBar: AppBar(
          title: Text("Cardio"),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              // tablerin isimleri
              Tab(text: "page1"),
              Tab(text: "page2"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Sayfa iceriklerini widget olarak olusturup childerenlara ekleyin.
            Container(color: Colors.red),
            Container(color: Colors.green),
          ],
        ),
      ),
    );
  }
}
