import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/food.dart';
import 'package:flutter_application_2/widgets/list_item.dart';

class ListModuleFood extends StatefulWidget {
  const ListModuleFood({super.key});

  @override
  State<ListModuleFood> createState() => _ListModuleFood();
}

class _ListModuleFood extends State<ListModuleFood> {
  List<Food> _data = [];

  _ListModuleFood() {
    _data.add(Food(
        id: 1,
        name: "Makarna",
        description: "Makarna desc",
        imagePath: "assets/food.png",
        calorie: 150));
    _data.add(Food(
        id: 1,
        name: "Makarna",
        description: "Makarna desc",
        imagePath: "assets/food.png",
        calorie: 150));
    _data.add(Food(
        id: 1,
        name: "Makarna",
        description: "Makarna desc",
        imagePath: "assets/food.png",
        calorie: 150));
    _data.add(Food(
        id: 1,
        name: "Makarna",
        description: "Makarna desc",
        imagePath: "assets/food.png",
        calorie: 150));
    _data.add(Food(
        id: 1,
        name: "Makarna",
        description: "Makarna desc",
        imagePath: "assets/food.png",
        calorie: 150));
    _data.add(Food(
        id: 1,
        name: "Makarna",
        description: "Makarna desc",
        imagePath: "assets/food.png",
        calorie: 150));
    _data.add(Food(
        id: 1,
        name: "Makarna",
        description: "Makarna desc",
        imagePath: "assets/food.png",
        calorie: 150));
    _data.add(Food(
        id: 1,
        name: "Makarna",
        description: "Makarna desc",
        imagePath: "assets/food.png",
        calorie: 150));
    _data.add(Food(
        id: 1,
        name: "Makarna",
        description: "Makarna desc",
        imagePath: "assets/food.png",
        calorie: 150));
    _data.add(Food(
        id: 1,
        name: "Makarna",
        description: "Makarna desc",
        imagePath: "assets/food.png",
        calorie: 150));
    _data.add(Food(
        id: 1,
        name: "Makarna",
        description: "Makarna desc",
        imagePath: "assets/food.png",
        calorie: 150));
    _data.add(Food(
        id: 1,
        name: "Makarna",
        description: "Makarna desc",
        imagePath: "assets/food.png",
        calorie: 150));
    _data.add(Food(
        id: 1,
        name: "Makarna",
        description: "Makarna desc",
        imagePath: "assets/food.png",
        calorie: 150));
    _data.add(Food(
        id: 1,
        name: "Makarna",
        description: "Makarna desc",
        imagePath: "assets/food.png",
        calorie: 150));
    _data.add(Food(
        id: 1,
        name: "Makarna",
        description: "Makarna desc",
        imagePath: "assets/food.png",
        calorie: 150));
  }

  bool isCompleted = false;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 15,
        ),
        Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 5, right: 5, bottom: 25),
                height: 720,
                child: ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    return _buildPageItem(index);
                  },
                ))),
        Container(
          child: Row(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Toplam Kalori: " + calculateTotalCal(_data).toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        )
      ]),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(_data[index].imagePath))),
        ),
        Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(left: 40, right: 40, top: 140),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white70,
              ),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(children: [
                  Text(
                    _data[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "Kalori: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        _data[index].calorie.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 120),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _data[index].isAdded = !_data[index].isAdded;
                            });
                          },
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 22),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              foregroundColor: (_data[index].isAdded == false)
                                  ? Colors.white
                                  : Colors.green,
                              backgroundColor: Colors.blue),
                          child: Icon(
                            Icons.add_circle_outline_rounded,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  )
                ]),
              ),
            ))
      ],
    );
  }
}

double calculateTotalCal(List<Food> data) {
  double total = 0;

  for (int i = 0; i < data.length; i++) {
    if (data[i].isAdded == true) {
      total += data[i].calorie;
    }
  }
  return total;
}

/*
class Item {
  String title;
  String description;
  bool isExpanded;

  Item(
      {required this.description,
      required this.title,
      this.isExpanded = false});
}
*/
/*
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
*/