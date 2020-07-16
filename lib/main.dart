import 'package:alibisv2/homepage.dart';
import 'package:flutter/material.dart';
//alarm_manager有点复杂，没写出来
//import 'package:android_alarm_manager/android_alarm_manager.dart';

void main() {
//注册alarm_manager
//  await AndroidAlarmManager.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
