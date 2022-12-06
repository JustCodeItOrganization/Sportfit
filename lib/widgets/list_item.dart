import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 100,
          color: Colors.deepPurple[200],
          child: ListTile(
              title: Text("Exercise"),
              subtitle: Text("Exercise description"),
              trailing: Icon(Icons.edit))),
    );
  }
}
