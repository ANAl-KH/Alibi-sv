import 'package:flutter/material.dart';
import 'package:gps/gps.dart';
import 'package:crypto/crypto.dart';
import 'dart:math';

class CreateAlibi extends StatefulWidget {
  @override
  _CreateAlibiState createState() => _CreateAlibiState();
}

class _CreateAlibiState extends State<CreateAlibi> {
  void getalibi() async {
    var latlng = await Gps.currentGps();
    var alibitime = DateTime.now();
    var alibiutctime = alibitime.millisecondsSinceEpoch;
    var randomkey = Random();
    print(randomkey);
    print(alibitime);
    print(alibiutctime);
    print(latlng.lat);
    print(latlng.lng);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(onPressed: () {
          getalibi();
        }),
        Text('点击按钮生成一个不在场证明'),
      ],
    );
  }
}
