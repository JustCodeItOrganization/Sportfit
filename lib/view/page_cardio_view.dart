import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_2/view/complete_timer_view.dart';
import 'package:flutter_application_2/view/kronometre_view.dart';
import 'package:flutter_application_2/view/timer_view.dart';
import 'package:flutter_application_2/widgets/button_widget.dart';
import 'package:flutter_application_2/widgets/navigation_menu.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PageCardioView extends StatefulWidget {
  const PageCardioView({Key? key}) : super(key: key);

  @override
  _PageCardioViewState createState() => _PageCardioViewState();
}

class _PageCardioViewState extends State<PageCardioView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: const NavMenu(),
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.timer)),
              Tab(
                icon: Icon(Icons.hourglass_empty_outlined),
              )
            ]),
            title: const Text(
              "Kardiyo",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: TabBarView(children: [const CompleteTimer(), KronometreView()]),
        ));
  }
}
