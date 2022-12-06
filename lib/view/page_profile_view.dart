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
    return MaterialApp(
      title: "SportFit",
      home: Scaffold(
          drawer: const NavMenu(),
          appBar: AppBar(
            title: const Text(
              "Profil Sayfası",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: Center(child: ProfileView())),
    );
  }
}
