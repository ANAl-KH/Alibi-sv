/*
import 'dart:convert';

Alibi alibiFromJson(String str) {
  final jsonData = json.decode(str);
  return Alibi.fromMap(jsonData);
}

String alibiToJson(Alibi data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Alibi {
  String utc;
  String latitude;
  String longitude;
  String saltkey;
  String txid;
  Alibi({this.utc, this.latitude, this.longitude, this.saltkey, this.txid});
  factory Alibi.fromMap(Map<String, dynamic> json) => new Alibi(
        utc: json['utc'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        saltkey: json['saltker'],
        txid: json['txid'],
      );
  Map<String, dynamic> toMap() => {
        "utc": utc,
        "latitude": latitude,
        "longitude": longitude,
        "saltkey": saltkey,
        "txid": txid,
      };
}
*/
