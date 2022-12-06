import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/NavMenu.dart';
import 'package:flutter_application_2/view/input_module_view.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // length = tab sayisi
      length: 2,
      child: Scaffold(
        drawer: const NavMenu(),
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: "page1"),
              Tab(text: "page2"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Sayfa iceriklerini widget olarak olusturup childerenlara ekleyin.
            const HomePageViewFirstSectionView(),
            Container(color: Colors.green),
          ],
        ),
      ),
    );
  }
}

class StandardPageColor {
  static Color headline5Color = Colors.yellow;
}

class HomePageViewFirstSectionView extends StatelessWidget {
  const HomePageViewFirstSectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 200,
            height: 200,
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 100),
            //alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/welcome.png"),
                ),
                shape: BoxShape.circle,
                color: Colors.red,
                border: Border.all(width: 15, color: Colors.blue),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 5,
                    blurRadius: 20,
                  ),
                ]),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: Text(
              "YENI DENEME TEXT",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          inputElevatedButton(),
          inputElevatedButton(),
        ]);
  }
}
