import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/page_cardio_view.dart';
import 'package:flutter_application_2/widgets/button_widget.dart';

class KronometreView extends StatefulWidget {
  KronometreView({super.key});

  @override
  State<StatefulWidget> createState() => _KronometreView();
}

class _KronometreView extends State<KronometreView>
    with AutomaticKeepAliveClientMixin<KronometreView> {
  int seconds = 0;
  int milisec = 0, _miliSec = 0;
  Timer? timer, timerMilSec;
  bool calis = true;

  @override
  void initState() {
    super.initState();
  }

  void resetTimer() {
    setState(() {
      seconds = 0;
      milisec = 0;
    });
  }

  void startTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    timer = Timer.periodic(const Duration(milliseconds: 1000), (_) {
      if (calis) {
        setState(() => seconds = seconds + 1);
      } else {
        stopTimer(reset: false);
      }
    });

    timerMilSec = Timer.periodic(const Duration(milliseconds: 10), (_) {
      setState(() {
        _miliSec = _miliSec + 1;
      });
      if (milisec < 100) {
        setState(() {
          milisec = milisec + 1;
        });
      } else {
        milisec = 0;
      }
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    setState(() {
      timer?.cancel();
      timerMilSec?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTimer(),
          const SizedBox(
            height: 40,
          ),
          buildButtons(),
        ],
      )),
    );
  }

  Widget buildButtons() {
    final isRunning = (seconds > 0);
    var isStarted = false;
    return isRunning || isStarted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: calis ? 'Durdur' : 'Devam Ettir',
                onClicked: () {
                  if (calis) {
                    stopTimer(reset: false);
                    calis = false;
                  } else {
                    startTimer(reset: false);
                    calis = true;
                  }
                },
              ),
              const SizedBox(
                width: 12,
              ),
              ButtonWidget(
                text: 'İptal Et',
                onClicked: () {
                  isStarted = false;
                  calis = false;
                  stopTimer();
                },
              )
            ],
          )
        : ButtonWidget(
            text: "Başlat",
            color: Colors.white,
            backgroundColor: Colors.blue,
            onClicked: () {
              isStarted = true;
              calis = true;
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
              value: ((seconds % 60) / 60),
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
              strokeWidth: 12,
              backgroundColor: Colors.white,
            ),
            Center(
              child: buildTime(),
            )
          ],
        ),
      );

  Widget buildTime() {
    return Text(
      '${'${(seconds / 60).floor()}'.padLeft(2, '0')}:${'${seconds % 60}'.padLeft(2, '0')}:${'$milisec'.padLeft(2, '0')}',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blue,
        fontSize: 30,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
