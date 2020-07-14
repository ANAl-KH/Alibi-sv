import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:gps/gps.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double lat = 51.507;
  double lng = -0.128;
  bool stoploop = true;
//  void getgps() async {
//    var latlng = await Gps.currentGps();
//    setState(() {
//      lat = double.parse(latlng.lat);
//      lng = double.parse(latlng.lng);
//    });
//    print(latlng.lng);
//    print(latlng);
//  }

  @override
  Widget build(BuildContext context) {
    //  getgps();
    return Card(
      child: Container(
        height: 100,
        width: 100,
        child: new FlutterMap(
          options: new MapOptions(
            center: new LatLng(51.5, -0.09),
            zoom: 13.0,
          ),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/ma674359954/ckcledi4a0giq1jsedpch1v6i/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWE2NzQzNTk5NTQiLCJhIjoiY2tjajI3ZmtkMG10bTJwbWlrZDMyN3VyeiJ9.FOJNNQoj-wkoo5dauU-_vg",
                subdomains: ['a', 'b', 'c']),
            new MarkerLayerOptions(
              markers: [
                new Marker(
                  width: 80.0,
                  height: 80.0,
                  point: new LatLng(51.5, -0.09),
                  builder: (ctx) => new Container(
                    child: new FlutterLogo(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
