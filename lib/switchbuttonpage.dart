import 'package:flutter/material.dart';
import 'gpsinfo.dart';
import 'package:latlong/latlong.dart';
import 'package:gps/gps.dart';
import 'dart:async';

class SwitchPage extends StatefulWidget {
  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  GlobalKey<GpsInfoState> gpsKey = GlobalKey();

  void getgps() async {
    var latlng = await Gps.currentGps();
    //double lat = double.parse(latlng.lat);
    //double lng = double.parse(latlng.lng);
    print(latlng.lat);
    print(latlng.lng);
    gpsKey.currentState.refreshgps(latlng.lat, latlng.lng);
  }

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
        ],
      ),
    );
  }
}
