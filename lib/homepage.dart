import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:gps/gps.dart';
//import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  double lat = 51.507;
  double lng = -0.128;
  void getgps() async {
    var latlng = await Gps.currentGps();
    setState(() {
      lat = double.parse(latlng.lat);
      lng = double.parse(latlng.lng);
    });
  }

  @override
  void initState() {
    getgps();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  getgps();
    print('1次');
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(lat, lng),
                zoom: 13.0,
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/ma674359954/ckcledi4a0giq1jsedpch1v6i/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWE2NzQzNTk5NTQiLCJhIjoiY2tjajI3ZmtkMG10bTJwbWlrZDMyN3VyeiJ9.FOJNNQoj-wkoo5dauU-_vg",
                    subdomains: ['a', 'b', 'c']),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(lat, lng),
                      builder: (ctx) => Container(
                        child: FlutterLogo(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text('sdfsdfsdfsdf'),
          Text('sdfsdfsdfsdf'),
          Text('sdfsdfsdfsdf'),
          Text('sdfsdfsdfsdf'),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}
