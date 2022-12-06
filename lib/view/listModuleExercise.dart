import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/listItem.dart';

class ListModuleExercise extends StatefulWidget {
  const ListModuleExercise({super.key});

  @override
  State<ListModuleExercise> createState() => _ListModuleExercise();
}

class _ListModuleExercise extends State<ListModuleExercise> {
  List<Item> _data = [];

  _ListModuleExercise() {
    Item i1 = Item(description: "egzersiz1", title: "egzersiz adi1");
    _data.add(i1);
    Item i2 = Item(description: "egzersiz2", title: "egzersiz adi2");
    _data.add(i2);
    Item i3 = Item(description: "egzersiz3", title: "egzersiz adi3");
    _data.add(i3);
    Item i4 = Item(description: "egzersiz4", title: "egzersiz adi4");
    _data.add(i4);
    Item i5 = Item(description: "egzersiz5", title: "egzersiz adi5");
    _data.add(i5);
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int panelIndex, bool isExpanded) {
        setState(() {
          _data[panelIndex].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
            canTapOnHeader: true,
            headerBuilder: ((BuildContext context, bool isExpanded) {
              return ListTile(title: Text(item.title));
            }),
            isExpanded: item.isExpanded,
            body: ListTile(
              title: Text(item.description),
              subtitle: Text(item.description),
              trailing: Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((element) => item == element);
                });
              },
            ));
      }).toList(),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _buildPanel(),
        ),
      ),
    );
  }
}

class Item {
  String title;
  String description;
  bool isExpanded;

  Item(
      {required this.description,
      required this.title,
      this.isExpanded = false});
}

List<Item> generateItem(int num) {
  return List.generate(num, (index) {
    return Item(
        description: "description $index",
        title: "ITEM $index",
        isExpanded: false);
  });
}
