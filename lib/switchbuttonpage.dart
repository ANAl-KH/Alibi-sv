import 'package:flutter/material.dart';
import 'gpsinfo.dart';
import 'package:gps/gps.dart';
import 'dart:async';
import 'creatalibi.dart';

class SwitchPage extends StatefulWidget {
  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  GlobalKey<GpsInfoState> gpsKey = GlobalKey();

  void getgps() async {
    try {
      var latlng = await Gps.currentGps();
      gpsKey.currentState.refreshgps(latlng.lat, latlng.lng);
    } catch (e) {
      print('gps信息获取失败');
    }
  }

//每6秒刷新一次当前gps位置信息，用GlobalKey实现了局部刷新
  void refreshtimer() {
    Timer.periodic(Duration(seconds: 6), (timer) {
      getgps();
    });
  }

  @override
  Widget build(BuildContext context) {
    getgps();
    refreshtimer();
    return Scaffold(
      body: Column(
        children: <Widget>[
          GpsInfo(gpsKey),
          CreateAlibi(),
        ],
      ),
    );
  }
}
