import 'package:flutter/material.dart';
import 'package:plank_app/components/dependencies.dart';
import 'package:plank_app/components/elapsed_time.dart';
import 'package:plank_app/components/storage_service.dart';
import 'package:plank_app/components/time_history_list.dart';
import 'package:plank_app/components/timer_text.dart';

class TimerPage extends StatefulWidget {
  @override
  TimerPageState createState() => TimerPageState();
}

class TimerPageState extends State<TimerPage> {
  final Dependencies dependencies = Dependencies();
  final StorageService storage = StorageService();
  final ElapsedTime et = ElapsedTime();

  void leftButtonPressed() {
    setState(() {
      if (dependencies.stopwatch.isRunning) {
        final String timeStr =
            et.format(dependencies.stopwatch.elapsedMilliseconds);

        /// Save to local storage.
        storage.addHistory(timeStr);
        print('time: $timeStr');
      } else {
        storage.deleteHistory();
        dependencies.stopwatch.reset();
      }
    });
  }

  void rightButtonPressed() {
    setState(() {
      if (dependencies.stopwatch.isRunning) {
        final String timeStr =
            et.format(dependencies.stopwatch.elapsedMilliseconds);
        dependencies.stopwatch.stop();
        storage.addHistory(timeStr);
      } else {
        dependencies.stopwatch.start();
      }
    });
  }

  Widget buildFloatingButton(
      String text, Color bgColor, VoidCallback callback) {
    TextStyle roundTextStyle =
        const TextStyle(fontSize: 20.0, color: Colors.white);
    return SizedBox(
      width: 80,
      height: 80,
      child: FloatingActionButton(
          backgroundColor: bgColor,
          child: Text(text, style: roundTextStyle),
          onPressed: callback),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: TimerText(dependencies: dependencies),
        ),
        Expanded(
          flex: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildFloatingButton(
                    dependencies.stopwatch.isRunning ? 'Lap' : 'Reset',
                    Colors.grey,
                    leftButtonPressed),
                buildFloatingButton(
                    dependencies.stopwatch.isRunning ? 'Stop' : 'Start',
                    Colors.green,
                    rightButtonPressed),
              ],
            ),
          ),
        ),
        Expanded(
          child: TimeHistoryList(storage),
        ),
      ],
    );
  }
}
