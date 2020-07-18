import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  void readalibi() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();

    print(keys);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
