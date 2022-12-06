import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/navigation_menu.dart';
import 'package:flutter_application_2/view/profile_view.dart';

class PageProfileView extends StatefulWidget {
  const PageProfileView({Key? key}) : super(key: key);

  @override
  _PageProfileViewState createState() => _PageProfileViewState();
}

class _PageProfileViewState extends State<PageProfileView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // length = tab sayisi
      length: 1,

      child: Scaffold(
        drawer: const NavMenu(),
        appBar: AppBar(
          title: Text("My Profile"),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              //tablerin isimleri
              Tab(text: "Profile"),
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
