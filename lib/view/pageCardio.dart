import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/NavMenu.dart';






class pageCardio extends StatefulWidget {
  const pageCardio({Key? key}) : super(key: key);

  @override
  _pageCardioState createState() => _pageCardioState();
}

class _pageCardioState extends State<pageCardio> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      // length = tab sayisi
      length: 2,
      child: Scaffold(
        drawer: const NavMenu(),
        appBar: AppBar(
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
            Container(color:Colors.red),
            Container(color: Colors.green),
          ],
        ),

      ),
    );
  }
}
