import 'dart:async';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/view_model/home_view_model.dart';
import 'package:flutter_application_2/widgets/button_widget.dart';
import 'package:flutter_application_2/widgets/rounded_arrow_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class TimerView extends StatefulWidget {
  const TimerView({super.key});

  @override
  State<StatefulWidget> createState() => _TimerView();
}

class _TimerView extends State<TimerView> {
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;

  void resetTimer() => setState(() => seconds = maxSeconds);

  void startTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    timer = Timer.periodic(Duration(milliseconds: 50), (_) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        stopTimer(reset: false);
      }
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("timer"),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTimer(),
            SizedBox(
              height: 80,
            ),
            buildButtons(),
          ],
        )),
      ),
    );
  }

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = seconds == 0 || seconds == maxSeconds;

    return isRunning || !isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: isRunning ? 'Pause' : 'Resume',
                onClicked: () {
                  if (isRunning) {
                    stopTimer(reset: false);
                  } else {
                    startTimer(reset: false);
                  }
                },
              ),
              const SizedBox(
                width: 12,
              ),
              ButtonWidget(
                text: 'Cancel',
                onClicked: stopTimer,
              )
            ],
          )
        : ButtonWidget(
            text: "Start timer",
            color: Colors.black,
            backgroundColor: Colors.white,
            onClicked: () {
              startTimer();
            },
          );
  }

  Widget buildTimer() => SizedBox(
        width: 200,
        height: 200,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: 1 - seconds / maxSeconds,
              valueColor: AlwaysStoppedAnimation(Colors.white),
              strokeWidth: 12,
              backgroundColor: Colors.green,
            ),
            Center(
              child: buildTime(),
            )
          ],
        ),
      );

  Widget buildTime() {
    if (seconds == 0) {
      return Icon(Icons.done, color: Colors.greenAccent, size: 112);
    } else {
      return Text(
        '$seconds',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 80,
        ),
      );
    }
  }
}
