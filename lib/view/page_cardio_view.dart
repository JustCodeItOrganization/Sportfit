import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_2/view/kronometre_view.dart';
import 'package:flutter_application_2/view/timer_view.dart';
import 'package:flutter_application_2/widgets/button_widget.dart';
import 'package:flutter_application_2/widgets/navigation_menu.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class PageCardioView extends StatefulWidget {
  const PageCardioView({Key? key}) : super(key: key);

  @override
  _PageCardioViewState createState() => _PageCardioViewState();
}

class _PageCardioViewState extends State<PageCardioView> {
  String dropdown_value = list.first;
  int? eachRepeat = 60;
  int? numOfRepeat;
  int? eachRest;
  bool isReady = false;
  bool isFieldsEnabled = true;

  List<Widget> timerWidgets = <Widget>[];
  Allocation? alloc;

  Widget returnTimer() {
    return TimerView(alloc: alloc!);
  }

  Widget buildTimer() {
    //final bool start = (isReady == true) ? true : false;

    return !isReady
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                  text: "Anternmana Başla",
                  onClicked: () {
                    setState(() {
                      alloc!.time = eachRepeat!;
                      alloc!.title = dropdown_value;
                      isFieldsEnabled = false;
                      isReady = true;
                    });
                  }),
            ],
          )
        : TimerView(alloc: alloc!);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "SportFit",
        home: Scaffold(
          drawer: const NavMenu(),
          appBar: AppBar(
            title: const Text(
              "Kardiyo",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            elevation: 0,
          ),
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
                  /*
                  Expanded(
                      child: TextField(
                    enabled: isFieldsEnabled,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Dinlenme"),
                    onChanged: ((String text) {
                      eachRest = int.parse(text);
                    }),
                  )),
                  */
                  /*
                  Expanded(
                      child: TextField(
                    enabled: isFieldsEnabled,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Tekrar Adedi"),
                    onChanged: (text) {
                      numOfRepeat = int.parse(text);
                    },
                  )),
                  */
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(child: buildTimer())
            ],
          )),
        ) //Center()child: TimerView())),
        );
  }
}

class Allocation {
  int time;
  String title;
  Allocation(this.time, this.title);
}
