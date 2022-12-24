import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/button_widget.dart';
import '../widgets/navigation_menu.dart';
import 'timer_view.dart';

class CompleteTimer extends StatefulWidget {
  const CompleteTimer({super.key});

  @override
  State<CompleteTimer> createState() => _CompleteTimerState();
}

const List<String> list = <String>[
  "Bench Press",
  "Bent Over Row",
  "Deadlift",
  "Decline Press",
  "Dumbell Press",
  "Dumbell Curl",
  "Machine Chest Fly",
  "Pull Ups",
  "Push Ups",
  "Shoulder Press",
  "Squat"
];

class _CompleteTimerState extends State<CompleteTimer>
    with AutomaticKeepAliveClientMixin<CompleteTimer> {
  String dropdown_value = list.first;
  int? eachRepeat = 60;
  int? numOfRepeat;
  int? eachRest;
  bool isReady = false;
  bool isFieldsEnabled = true;
  bool setBasladi = false;
  int counter = 0;
  String _buttonWidgetTitle = "Antrenmana Başla";
  List<Widget> timerWidgets = <Widget>[];
  late Allocation alloc;

  Widget? returnTimer() {
    return TimerView(
        alloc: alloc,
        autoStart: true,
        callback: () {
          setState(() {
            isReady = false;
            if (counter == numOfRepeat! * 2) {
              _buttonWidgetTitle = "Antrenmana Başla";
              setBasladi = false;
              isReady = false;
              isFieldsEnabled = true;
            } else if (counter % 2 == 0) {
              _buttonWidgetTitle = "Anternmana devam et";
            } else {
              _buttonWidgetTitle = "Dinlen";
            }
          });
        });
  }

  Widget? buildTimer() {
    return !isReady
        ? ButtonWidget(
            text: _buttonWidgetTitle,
            onClicked: () {
              print(counter);
              int _time;
              String _title;
              if (setBasladi == false) {
                counter = 0;
                setBasladi = true;
              }
              if (counter % 2 == 0) {
                _time = eachRepeat!;
                _title = dropdown_value;
                counter++;
              } else {
                _time = eachRest!;
                _title = "Dinlenme";
                counter++;
              }
              setState(() {
                alloc = Allocation(_time, _title);
                isFieldsEnabled = false;
                isReady = true;
              });
            })
        : returnTimer()!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "SportFit",
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
              child: Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  height: 75,
                  width: 300,
                  child: DropdownButtonFormField<String>(
                    disabledHint: Text(dropdown_value),
                    value: dropdown_value,
                    icon: const Icon(Icons.sports),
                    elevation: 16,
                    onChanged: isFieldsEnabled
                        ? (value) => setState(() => dropdown_value = value!)
                        : null,
                    items: list.map<DropdownMenuItem<String>>((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }).toList(),
                  )),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    enabled: isFieldsEnabled,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Tekrar Süre"),
                    onChanged: ((String text) {
                      eachRepeat = int.parse(text);
                    }),
                  )),
                  Expanded(
                      child: TextField(
                    enabled: isFieldsEnabled,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Dinlenme"),
                    onChanged: ((String text) {
                      eachRest = int.parse(text);
                    }),
                  )),
                  Expanded(
                      child: TextField(
                    enabled: isFieldsEnabled,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Tekrar Adedi"),
                    onChanged: (text) {
                      numOfRepeat = int.parse(text);
                    },
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(flex: 2, child: buildTimer()!)
            ],
          )),
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class Allocation {
  int time;
  String title;
  Allocation(this.time, this.title);
}
