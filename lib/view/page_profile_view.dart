import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/NavMenu.dart';
import 'package:flutter_application_2/view/profile_view.dart';

class pageProfile extends StatefulWidget {
  const pageProfile({Key? key}) : super(key: key);

  @override
  _pageProfileState createState() => _pageProfileState();
}

class _pageProfileState extends State<pageProfile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // length = tab sayisi
      length: 1,

      child: Scaffold(
        drawer: const NavMenu(),
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              //tablerin isimleri
              Tab(text: "page1"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Sayfa iceriklerini widget olarak olusturup childerenlara ekleyin.
            // page protfile
            ProfileView(),
          ],
        ),
      ),
    );
  }
}
