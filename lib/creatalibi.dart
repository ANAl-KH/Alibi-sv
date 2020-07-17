import 'package:flutter/material.dart';
import 'package:gps/gps.dart';
import 'package:crypto/crypto.dart';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CreateAlibi extends StatefulWidget {
  @override
  _CreateAlibiState createState() => _CreateAlibiState();
}

class _CreateAlibiState extends State<CreateAlibi> {
  final url = 'https://www.ddpurse.com/platform/openapi/v2/push_chain_data';
  //用一个随机数作为盐，用Hmac_sha256算出pgs加时间的哈希值，调用打点钱包的接口把这个哈希值上链
  //todo:等上链成功后拿到接口返回的txid，把txid和gps等信息存起来显示在alibipage页。
  void getalibi() async {
    try {
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
      Map mapbody = {"coin_type": "BSV", "data": "$alibihash", "data_type": 0};
      var jsonbody = json.encode(mapbody);
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'appid': '70083476d49f695d62ba67e707d5b6eb',
            'appsecret': 'ac75ab1021b4d2a874314cc084e28635'
          },
          body: jsonbody);
      //  if respose['code']
      print(randomkey);
      print(alibitime);
      print(alibiutctime);
      print(latlng.lat);
      print(latlng.lng);
      print(alibihash);
      print(allinfo);
      print(response);
      print(json.decode(response.body));
    } catch (e) {
      print('获取alibi失败');
    }
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
