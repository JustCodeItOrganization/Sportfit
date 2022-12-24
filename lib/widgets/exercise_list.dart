import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/exercise.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ExerciseList extends StatefulWidget {
  List<Map<String, dynamic>> a_items = [];
  String boxname = "";
  ExerciseList(List<Map<String, dynamic>> a_items, String boxname){
    this.a_items = a_items; 
    this.boxname = boxname;
    
  }
  @override
  State<ExerciseList> createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {
  late String boxxname = widget.boxname;

  late final _exerciseBox = Hive.box(boxxname);
  @override
  void initState(){
    super.initState();
    _refreshItems();
  }
  void _refreshItems(){
    final boxdata = _exerciseBox.keys.map((key) {
      final item = _exerciseBox.get(key);
      return {"key": key,
              "id": item["id"],
              "description": item["description"],
              "title": item["title"],
              "videoUrl": item["videoUrl"],
              "imagePath": item["imagePath"],
              "metabolicEquivalent": item["metabolicEquivalent"],
              "numOfReps": item["numOfReps"],
              "numOfSets": item["numOfSets"]
              };
    }).toList();

    setState(() {
      widget.a_items = boxdata.reversed.toList();
      print(widget.a_items.length);
    });
    }
  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _exerciseBox.add(newItem);
    _refreshItems();
    print ("amount data is ${_exerciseBox.length}");
  }
  Future<void> _deleteItem(int itemKey) async {
    await _exerciseBox.delete(itemKey);
    _refreshItems();
    print ("amount data is ${_exerciseBox.length}");
  }
//HIVE END

  void addexercise() {
    var exerciseindex;
    exerciseindex = _exerciseList.indexOf(_exerciseName);
    print("index : ${exerciseindex}");
    _createItem({
      "id": UniqueKey().toString(),
      "description": _exerciseDesc[exerciseindex],
      "title": _exerciseName,
      "videoUrl": _exerciseVideo[exerciseindex],
      "imagePath": _exerciseImg[exerciseindex],
      "metabolicEquivalent": 1.toString(),
      "numOfReps": _repValue,
      "numOfSets": _setValue
    });
  }
  final List _exerciseList = ["Bench Press", "Bent Over Row", "Deadlift", "Decline Press", "Dumbell Press", "Dumbell Curl", "Machine Chest Fly", "Pull Ups", "Push Ups", "Shoulder Press", "Squat"];
  final List _exerciseDesc = ["Bench Press", "Bent Over Row", "Deadlift", "Decline Press", "Dumbell Press", "Dumbell Curl", "Machine Chest Fly", "Pull Ups", "Push Ups", "Shoulder Press", "Squat"];
  final List _exerciseVideo = ["https://www.youtube.com/watch?v=SCVCLChPQFY", "", "https://www.youtube.com/watch?v=1ZXobu7JvvE", "https://www.youtube.com/watch?v=iVh4B5bJ5OI", "https://www.youtube.com/watch?v=AqzDJHxynwo", "", "https://www.youtube.com/watch?v=th4z6ke6FHE", "", "https://www.youtube.com/watch?v=_l3ySVKYVJ8", "https://www.youtube.com/watch?v=5yWaNOvgFCM", "https://www.youtube.com/watch?v=ultWZbUMPL8"];
  final List _exerciseImg = ["assets/bench-press.png", "assets/bent-over-row.jpg", "assets/deadlift.jpg", "assets/decline-bench-press.jpg", "assets/dumbell-bench-press.jpg", "assets/dumbell-curl.jpg", "assets/machine-chest-fly.jpg", "assets/pull-ups.jpg", "assets/push-ups.jpg", "assets/shoulder-press.jpg", "assets/squat.jpg"];
  String _exerciseName = "Bench Press";
  int _setValue = 1;
  int _repValue = 1;
  List<Exercise> _data = [];
  double totalCal = 0;
  double completedCal = 0;
  _ExerciseListState() {
    _data.add(
      Exercise(
          id: "1",
          description: "description",
          title: "Deadlift",
          videoUrl: "www.",
          imagePath:
              "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
          metabolicEquivalent: 5,
          numOfSets: 4,
          numOfReps: 4),
    );
    _data.add(
      Exercise(
          id: "2",
          description: "description",
          title: "Squat",
          videoUrl: "www.",
          imagePath:
              "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
          metabolicEquivalent: 5,
          numOfSets: 3,
          numOfReps: 4),
    );
    _data.add(
      Exercise(
          id: "3",
          description: "description",
          title: "Row",
          videoUrl: "www.",
          imagePath:
              "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
          metabolicEquivalent: 5,
          numOfSets: 4,
          numOfReps: 4),
    );
    _data.add(
      Exercise(
          id: "4",
          description: "description",
          title: "Push up",
          videoUrl: "www.",
          imagePath:
              "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
          metabolicEquivalent: 5,
          numOfSets: 4,
          numOfReps: 4),
    );
    _data.add(
      Exercise(
          id: "5",
          description: "description",
          title: "Pull up",
          videoUrl: "www.",
          imagePath:
              "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
          metabolicEquivalent: 5,
          numOfSets: 4,
          numOfReps: 4),
    );
    _data.add(
      Exercise(
          id: "6",
          description: "description",
          title: "Walking high knees",
          videoUrl: "www.",
          imagePath:
              "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
          metabolicEquivalent: 5,
          numOfSets: 4,
          numOfReps: 4),
    );
    _data.add(
      Exercise(
          id: "7",
          description: "description",
          title: "Knee push ups",
          videoUrl: "www.",
          imagePath:
              "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
          metabolicEquivalent: 5,
          numOfSets: 4,
          numOfReps: 4),
    );
    _data.add(
      Exercise(
          id: "8",
          description: "description",
          title: "Jumping jacks",
          videoUrl: "www.",
          imagePath:
              "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
          metabolicEquivalent: 5,
          numOfSets: 4,
          numOfReps: 4),
    );
    totalCal = calculateTotalCal(_data, 70);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: UniqueKey(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(),
          elevation: 0.0,
          child: new Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              enableDrag: false,
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setModalState) {
                    return Container(
                      height: 400,
                      padding: EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 15,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                alignment: Alignment.center,
                                height: 40.0,
                                decoration: BoxDecoration(
                                    color: Color(0xfffffffff),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.grey.shade200,
                                    )),
                              ),
                              Container(
                                child: NumberPicker(
                                  axis: Axis.horizontal,
                                  itemHeight: 45,
                                  itemWidth: 45,
                                  itemCount: 7,
                                  value: _setValue,
                                  minValue: 1,
                                  maxValue: 20,
                                  onChanged: (value) {
                                    setModalState(() {
                                      _setValue = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 15,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                alignment: Alignment.center,
                                height: 40.0,
                                decoration: BoxDecoration(
                                    color: Color(0xfffffffff),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.grey.shade200,
                                    )),
                              ),
                              Container(
                                child: NumberPicker(
                                  axis: Axis.horizontal,
                                  itemHeight: 45,
                                  itemWidth: 45,
                                  itemCount: 7,
                                  value: _repValue,
                                  minValue: 1,
                                  maxValue: 100,
                                  onChanged: (value) {
                                    setModalState(() {
                                      _repValue = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          DropdownButton(
                            items: _exerciseList
                                .map((e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            value: _exerciseName,
                            onChanged: (value) {
                              setModalState(() {
                                _exerciseName = value as String;
                              });
                              print(_exerciseName);
                            },
                          ),
                          ElevatedButton(
                              onPressed: () {
                                print(_data.length);
                                Navigator.pop(context);
                                setState(() {
                                  _data.add(Exercise(
                                      id: UniqueKey().toString(),
                                      description: "description",
                                      title: _exerciseName,
                                      videoUrl: "www.",
                                      imagePath:
                                          "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
                                      metabolicEquivalent: 1,    
                                      numOfReps: _repValue,
                                      numOfSets: _setValue));
                                  addexercise();
                                });
                                totalCal = calculateTotalCal(_data, 70);
                                print(totalCal);
                              },
                              child: Text("BAS")),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ReorderableListView.builder(
                buildDefaultDragHandles: false,
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    final index = newIndex > oldIndex ? newIndex - 1 : newIndex;

                    final reorderData = _data.removeAt(oldIndex);
                    _data.insert(index, reorderData);
                  });
                },
                itemCount: widget.a_items.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final curretItem = widget.a_items[index];
                  return ReorderableDelayedDragStartListener(
                  key: Key(curretItem['id'].toString()),
                  index: index,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Dismissible(
                      key: Key(curretItem['id'].toString()),
                      onDismissed: (direction) {
                        _deleteItem(curretItem['key']);
                        setState(() {
                          _data.removeAt(index);
                          totalCal = calculateTotalCal(_data, 70);
                          print(totalCal);
                        });
                      },
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(curretItem['imagePath']),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.black,
                                  Colors.black.withOpacity(0.3)
                                ],
                              ),
                            ),
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(curretItem['title'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w800)),
                                        Row(
                                          children: [
                                            Text(
                                              curretItem['numOfSets'].toString(),
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              " X ",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              curretItem['numOfReps'].toString(),
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            _data[index].isCompleted =
                                                !_data[index].isCompleted;
                                            completedCal =
                                                calculateCompletedCal(
                                                    _data, 70);
                                            print(completedCal);
                                          });
                                        },
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 22),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            foregroundColor:
                                                (_data[index].isCompleted ==
                                                        false)
                                                    ? Colors.red
                                                    : Colors.green,
                                            backgroundColor: Color.fromARGB(
                                                255, 59, 59, 59)),
                                        child: Icon(
                                          Icons.check,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0.0, vertical: 10.0),
                                      child: TextButton(
                                        onPressed: () {
                                          _launchVideo(
                                              Url:"https://www.youtube.com/watch?v=Vr3cYuWO6KU");
                                        },
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 22),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            foregroundColor: Colors.red,
                                            backgroundColor: Color.fromARGB(
                                                255, 59, 59, 59)),
                                        child: Icon(
                                          Icons.ondemand_video,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
  }),
            ),
          ],
        ));
  }
}

// kcal/dakika   dakikada harcanan kcal
double calculateCal(int met, int weigth) {
  return (met * (3.5) * weigth) / 200;
}

// 1 setin 45 saniye olduğu varsayılarak hesaplanmıştır. Exercise classına 1 set için gerekli süre eklenerek düzeltilebilir.
double calculateTotalCal(List<Exercise> data, int weigth) {
  double cal = 0;
  for (int i = 0; i < data.length; i++) {
    cal += calculateCal(data[i].metabolicEquivalent, weigth) *
        data[i].numOfSets *
        (3 / 4);
  }
  return cal;
}

double calculateCompletedCal(List<Exercise> data, int weigth) {
  double cal = 0;
  for (int i = 0; i < data.length; i++) {
    if (data[i].isCompleted == true) {
      cal += calculateCal(data[i].metabolicEquivalent, weigth) *
          data[i].numOfSets *
          (3 / 4);
    }
  }
  return cal;
}

_launchVideo({String Url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"}) async {
  if (kIsWeb) {
    if (await canLaunchUrl(Uri.parse(Url))) {
      await launchUrl(Uri.parse(Url));
    } else {
      throw 'Could not launch $Url';
    }
  } else if (Platform.isIOS) {
    if (await canLaunchUrl(
        Uri.parse('youtube://www.youtube.com/watch?v=dQw4w9WgXcQ'))) {
      await launchUrl(
          Uri.parse('youtube://www.youtube.com/watch?v=dQw4w9WgXcQ'));
    }
  } else {
    if (await canLaunchUrl(Uri.parse(Url))) {
      await launchUrl(Uri.parse(Url));
    } else {
      throw 'Could not launch https://www.youtube.com/watch?v=dQw4w9WgXcQ';
    }
  }
}

/*
List<Exercise> generateItem(int num) {
  return List.generate(num, (index) {
    return Exercise(
        description: "Egzersiz açıklaması $index",
        metabolicEquivalent: 5,
        numOfSets: 3,
        videoUrl: "www.",
        imagePath:
            "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
        title: "Egzersiz adı $index",
        isExpanded: false);
  });
}
*/
