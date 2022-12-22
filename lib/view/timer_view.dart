import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/page_cardio_view.dart';
import 'package:flutter_application_2/widgets/button_widget.dart';

class TimerView extends StatefulWidget {
  Allocation alloc;
  final VoidCallback callback;
  final bool autoStart;
  TimerView(
      {super.key,
      required this.alloc,
      required this.callback,
      required this.autoStart});

  @override
  State<StatefulWidget> createState() => _TimerView();
}

class _TimerView extends State<TimerView> {
  int maxSeconds = 0;
  int seconds = 0;
  Timer? timer;
  String _title = "deneme";
  late Allocation localAllocation;
  static final _mutex = AsyncMutex();

  @override
  void initState() {
    super.initState();
    localAllocation = widget.alloc;
    maxSeconds = seconds = localAllocation.time;
    _title = localAllocation.title;
    if (widget.autoStart == true) {
      startTimer();
    }
  }

  void resetTimer() => setState(() => seconds = maxSeconds);
/*
  Future<void> initialTimer() async {
    for (var alloc in localAllocation) {
      print(alloc.title);
      seconds = maxSeconds = alloc.time;
      _title = alloc.title;
      startTimer(reset: true);
      await _mutex.lock();
    }
  }
*/
  void startTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    timer = Timer.periodic(const Duration(milliseconds: 1000), (_) {
      if (seconds > 0) {
        setState(() => seconds = seconds - 1);
      } else {
        stopTimer(reset: false);
        setState(() {
          widget.callback();
        });
      }
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
      setState(() {
        widget.callback();
      });
    }
    setState(() {
      timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildTitle(),
          const SizedBox(
            height: 40,
          ),
          buildTimer(),
          const SizedBox(
            height: 40,
          ),
          buildButtons(),
        ],
      )),
    );
  }

  Widget buildTitle() {
    return Text(_title);
  }

  Widget buildButtons() {
    final isRunning = (timer == null) ? false : timer!.isActive;
    final isCompleted = (seconds == 0) || seconds == maxSeconds;

    return isRunning || !isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: isRunning ? 'Durdur' : 'Devam Ettir',
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
                text: 'İptal Et',
                onClicked: stopTimer,
              )
            ],
          )
        : ButtonWidget(
            text: "Başlat",
            color: Colors.white,
            backgroundColor: Colors.blue,
            onClicked: () {
              startTimer();
              //initialTimer();
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
              valueColor: const AlwaysStoppedAnimation(Colors.white),
              strokeWidth: 12,
              backgroundColor: Colors.blue,
            ),
            Center(
              child: buildTime(),
            )
          ],
        ),
      );

  Widget buildTime() {
    if (seconds == 0) {
      return const Icon(Icons.done, color: Colors.greenAccent, size: 112);
    } else {
      return Text(
        '$seconds',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
          fontSize: 80,
        ),
      );
    }
  }
}

class AsyncMutex {
  Completer<void>? _completer;

  /// locks the mutex
  Future<void> lock() async {
    while (_completer != null) {
      await _completer!.future;
    }
    _completer = Completer<void>();
  }

  /// unlocks the mutex
  void unlock() {
    assert(_completer != null);
    final completer = _completer!;
    _completer = null;
    completer.complete();
  }
}
