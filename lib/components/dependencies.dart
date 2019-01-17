import 'package:flutter/material.dart';
import 'package:plank_app/components/elapsed_time.dart';

class Dependencies {
  final List<ValueChanged<ElapsedTime>> timerListeners =
      <ValueChanged<ElapsedTime>>[];
  final TextStyle textStyle = const TextStyle(fontSize: 90.0);
  final Stopwatch stopwatch = Stopwatch();
  final int timerMillisecondsRefreshRate = 30;
}
