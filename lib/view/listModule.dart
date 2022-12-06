import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/listItem.dart';

class ListModule extends StatefulWidget {
  const ListModule({super.key});

  @override
  State<ListModule> createState() => _ListModule();
}

class _ListModule extends State<ListModule> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      physics: ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return ListItem();
      },
      itemCount: 10,
    ));
  }
}
