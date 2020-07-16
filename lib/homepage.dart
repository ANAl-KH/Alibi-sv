//底部导航栏

import 'package:flutter/material.dart';
import 'alibilistpage.dart';
import 'switchbuttonpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int _currentIndex;
  List<Widget> _controllerList;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _controllerList = [
      SwitchPage(),
      ListPage(),
    ];
  }

  void _bottomNaviOnTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: IndexedStack(
        index: this._currentIndex,
        children: this._controllerList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        onTap: _bottomNaviOnTap,
        currentIndex: _currentIndex,
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
      ),
    );
  }
}
