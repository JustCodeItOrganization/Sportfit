import 'package:flutter/material.dart';

class NavMenuPage extends StatelessWidget {
  final String navMenuPageName;
  final Widget? navMenuPageView;
  final Icon leadingIcon;
  const NavMenuPage(
      {Key? key,
      required this.navMenuPageName,
      required this.navMenuPageView,
      required this.leadingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon,
      title: Text(navMenuPageName),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => navMenuPageView!));
      },
    );
  }
}
