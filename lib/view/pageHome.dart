import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/NavMenu.dart';







class pageHome extends StatefulWidget {
  const pageHome({Key? key}) : super(key: key);

  @override
  _pageHomeState createState() => _pageHomeState();
}

class _pageHomeState extends State<pageHome> {
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
              Tab(text: "page1"),
              Tab(text: "page2"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Sayfa iceriklerini widget olarak olusturup childerenlara ekleyin.
            const pageHomeFirstSectionView(),
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

class HomeButtons extends StatelessWidget {
  final String textInButton;
  const HomeButtons({Key? key, required this.textInButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: SizedBox(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              ),
          onPressed: () {},
          child: Text(textInButton),
          //),
        ),
      ),
    );
  }
}

class pageHomeFirstSectionView extends StatelessWidget {
  const pageHomeFirstSectionView({Key? key}) : super(key: key);

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
          const HomeButtons(textInButton: "Profile"),
          const HomeButtons(textInButton: "Workout Plan"),
          const HomeButtons(textInButton: "Diet Plan"),
          const HomeButtons(textInButton: "Cardio"),
        ]);
  }
}
