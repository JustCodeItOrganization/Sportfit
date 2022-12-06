import 'package:flutter/material.dart';

class StandardPage extends StatelessWidget {
  const StandardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const TabBar(
          tabs: [
            Tab(text: "page1"),
            Tab(text: "page2"),
          ],
        ),
      ),
      body: TabBarView(children: [
        // Sayfa iceriklerini widget olarak olusturup childerenlara ekleyin.
        const StandardPageFirstView(),
        Container(color: Colors.red),
      ]),
      //bottomNavigationBar: BottomNavigationBar(items: const [
      //  BottomNavigationBarItem(
      //      icon: Icon(Icons.abc_outlined), label: "LABEL1"),
      //  BottomNavigationBarItem(
      //      icon: Icon(Icons.abc_outlined), label: "LABEL2"),
      //]),
      bottomNavigationBar: const BottomAppBar(
        child: TabBar(
          tabs: [
            Tab(
              child: Text(
                "Page1",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            Tab(
              child: Text(
                "Page2",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
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
          //style: ButtonStyle(
          //style: ElevatedButton.styleFrom(
          //  backgroundColor: Colors.blue,
          //  padding: const EdgeInsets.all(10),
          //),
          //foregroundColor:
          //MaterialStateProperty.all<Color>(Colors.blue),
          //),
          style: ElevatedButton.styleFrom(
              //maximumSize: const Size(50,50),
              //minimumSize: const Size(25,30),
              ),
          onPressed: () {},
          //child: SizedBox(
          //width: 50,
          child: Text(textInButton),
          //),
        ),
      ),
    );
  }
}

class StandardPageFirstView extends StatelessWidget {
  const StandardPageFirstView({Key? key}) : super(key: key);

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
                    //offset: Offset(0, 25),
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
