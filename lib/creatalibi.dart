import 'package:flutter/material.dart';
import 'package:gps/gps.dart';
import 'package:crypto/crypto.dart';
import 'dart:math';
import 'dart:convert';

class CreateAlibi extends StatefulWidget {
  @override
  _CreateAlibiState createState() => _CreateAlibiState();
}

class _CreateAlibiState extends State<CreateAlibi> {
  //用一个随机数作为盐，用Hmac_sha256算出pgs加时间的哈希值
  void getalibi() async {
    var latlng = await Gps.currentGps();
    var alibitime = DateTime.now();
    var alibiutctime = alibitime.millisecondsSinceEpoch.toString();
    var randomkey = utf8.encode(Random().nextInt(4294967296).toString());
    var allinfo = utf8.encode('latitude' +
        latlng.lat +
        'longitude' +
        latlng.lng +
        'UTCtime' +
        alibiutctime);
    var hmacSha256 = Hmac(sha256, randomkey);
    var alibihash = hmacSha256.convert(allinfo);
    print(randomkey);
    print(alibitime);
    print(alibiutctime);
    print(latlng.lat);
    print(latlng.lng);
    print(alibihash);
    print(allinfo);
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
