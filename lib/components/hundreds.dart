import 'package:flutter/material.dart';

import 'dependencies.dart';
import 'elapsed_time.dart';

class Hundreds extends StatefulWidget {
  Hundreds({this.dependencies});
  final Dependencies dependencies;

  @override
  HundredsState createState() => HundredsState(dependencies: dependencies);
}

class HundredsState extends State<Hundreds> {
  HundredsState({this.dependencies});
  final Dependencies dependencies;

  int hundreds = 0;

  @override
  void initState() {
    dependencies.timerListeners.add(onTick);
    super.initState();
  }

  void onTick(ElapsedTime elapsed) {
    if (elapsed.hundreds != hundreds) {
      setState(() {
        hundreds = elapsed.hundreds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');
    return Text(hundredsStr, style: dependencies.textStyle);
  }
}
