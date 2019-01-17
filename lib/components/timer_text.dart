import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plank_app/components/dependencies.dart';
import 'package:plank_app/components/elapsed_time.dart';
import 'package:plank_app/components/hundreds.dart';
import 'package:plank_app/components/minutes_and_seconds.dart';

class TimerText extends StatefulWidget {
  TimerText({this.dependencies});

  final Dependencies dependencies;

  @override
  TimerTextState createState() => TimerTextState(dependencies: dependencies);
}

class TimerTextState extends State<TimerText> {
  TimerTextState({this.dependencies});
  final Dependencies dependencies;
  Timer timer;
  int milliseconds;

  @override
  void initState() {
    timer = Timer.periodic(
        Duration(milliseconds: dependencies.timerMillisecondsRefreshRate),
        callback);
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  void callback(Timer timer) {
    if (milliseconds != dependencies.stopwatch.elapsedMilliseconds) {
      milliseconds = dependencies.stopwatch.elapsedMilliseconds;
      final int hundreds = (milliseconds / 10).truncate();
      final int seconds = (hundreds / 100).truncate();
      final int minutes = (seconds / 60).truncate();
      final ElapsedTime elapsedTime = ElapsedTime(
        hundreds: hundreds,
        seconds: seconds,
        minutes: minutes,
      );
      for (final listener in dependencies.timerListeners) {
        listener(elapsedTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RepaintBoundary(
          child: SizedBox(
            height: 72.0,
            child: MinutesAndSeconds(dependencies: dependencies),
          ),
        ),
        RepaintBoundary(
          child: SizedBox(
            height: 72.0,
            child: Hundreds(dependencies: dependencies),
          ),
        ),
      ],
    );
  }
}
