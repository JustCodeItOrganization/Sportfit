
import 'package:flutter/material.dart';

class NavMenuPage extends StatelessWidget {
  final String navMenuPageName;
  final Widget? navMenuPageView;
  const NavMenuPage(
      {Key? key, required this.navMenuPageName, required this.navMenuPageView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.favorite),
      title: Text(navMenuPageName),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => navMenuPageView!));
      },
    );
  }
}