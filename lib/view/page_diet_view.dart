import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/navigation_menu.dart';

class PageDietView extends StatefulWidget {
  const PageDietView({Key? key}) : super(key: key);

  @override
  _PageDietViewState createState() => _PageDietViewState();
}

class _PageDietViewState extends State<PageDietView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // length = tab sayisi
      length: 2,

      child: Scaffold(
        drawer: const NavMenu(),
        appBar: AppBar(
          title: Text("Diet"),
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
