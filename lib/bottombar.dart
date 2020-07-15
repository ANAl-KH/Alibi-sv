import 'package:alibisv2/alibipage.dart';
import 'package:alibisv2/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget>
    with AutomaticKeepAliveClientMixin {
  int _currentIndex = 0;

  final tabs = [
    HomePage(),
    AlibiPage(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Alibi'),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
