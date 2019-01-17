import 'package:flutter/material.dart';
import 'package:plank_app/components/timer_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: false,
      title: 'Plank App',
      theme: ThemeData.dark(),
      home: Application(),
    );
  }
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Timer', textAlign: TextAlign.center),
        ),
      ),
      body: Container(child: TimerPage()),
//      bottomNavigationBar: ,
    );
  }
}
