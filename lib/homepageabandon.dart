//本来首页放了个地图，但是出了内存泄露bug没修好。
/*
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:gps/gps.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  double lat;
  double lng;
  MapController mapController;

  void getgps() async {
    var latlng = await Gps.currentGps();
    mapController.move(
        LatLng(double.parse(latlng.lat), double.parse(latlng.lng)), 13);
    if (mounted) {
      setState(() {
        lat = double.parse(latlng.lat);
        lng = double.parse(latlng.lng);
      });
    }
  }

  void updatelatlng() {
    Timer(Duration(seconds: 10), () {
      getgps();
    });
    // Timer.periodic(Duration(minutes: 1), (timer) {
    //   getgps();
    //  });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    getgps();
    print('init一次');
    super.initState();
    mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    updatelatlng();
    //getgps();
    //  lat == null ? getgps() : updatelatlng();
    print('build一次');
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                center: LatLng(-31.4641241, 152.5380176),
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
          Flexible(
            flex: 1,
            Text('sdfsdfsdfsdf'),
          ),
        ],
      ),
    );
  }
}
*/
