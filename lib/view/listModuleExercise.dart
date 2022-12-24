import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/list_item.dart';

class ListModuleExercise extends StatefulWidget {
  const ListModuleExercise({super.key});

  @override
  State<ListModuleExercise> createState() => _ListModuleExercise();
}

class _ListModuleExercise extends State<ListModuleExercise> {
  List<Item> _data = generateItem(15);

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
              trailing: Icon(Icons.add_circle),
            ));
      }).toList(),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
        description: "Egzersiz açıklaması $index",
        title: "Egzersiz adı $index",
        isExpanded: false);
  });
}
