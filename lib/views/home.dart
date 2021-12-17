import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_map/flutter_map.dart';
// ignore: import_of_legacy_library_into_null_safe
import "package:latlong/latlong.dart" as latLng;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFB8B8B8).withOpacity(0.7),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                color: Colors.black,
                size: 30,
              ),
              TrackALZText(),
              Icon(
                Icons.notifications,
                color: Colors.black,
                size: 30,
              ),
            ],
          )),
      body: Wrap(
        children: [
          Row(
            children: [
              Container(
                width: size.width * 0.5,
                padding: EdgeInsets.only(top: 12, bottom: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2, color: Colors.black, style: BorderStyle.solid),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Map",
                    style: TextStyle(
                      color: Color(0xFF291F1F).withOpacity(0.8),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0, 4),
                          blurRadius: 4.0,
                          color: Color(0xFF291F1F).withOpacity(0.25),
                        ),
                      ],
                    ),
                  )
                ),
              ),
              Container(
                width: size.width * 0.5,
                padding: EdgeInsets.only(top: 12, bottom: 12),
                child: Center(
                  child: Text(
                    "Semelles",
                    style: TextStyle(
                      color: Color(0xFF565656).withOpacity(0.8),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ),
              ),
            ],
          ),
          FlutterMap(
            options: MapOptions(
              center: latLng.LatLng(51.5, -0.09),
              zoom: 13.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: "https://api.mapbox.com/styles/v1/younessaa/ckx90ituiahod14o36ai2g97e/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoieW91bmVzc2FhIiwiYSI6ImNreDh6N3Y5ZDB1YmUybm1uMWQ5NDFlOXEifQ.BL9saIFBLaZn4lruSIKnuw",
                additionalOptions: {
                  'accessToken' : 'pk.eyJ1IjoieW91bmVzc2FhIiwiYSI6ImNreDh6N3Y5ZDB1YmUybm1uMWQ5NDFlOXEifQ.BL9saIFBLaZn4lruSIKnuw',
                  'id' : 'mapbox.mapbox-streets-v8'
                },
              ),
              // MarkerLayerOptions(
                // markers: [
                  // Marker(
                    // width: 80.0,
                    // height: 80.0,
                    // point: latLng.LatLng(51.5, -0.09),
                    // builder: (ctx) =>
                    // Container(
                      // child: FlutterLogo(),
                    // ),
                  // ),
                // ],
              // ),
            ],
          )
        ],
      ),
    );
  }
}

class TrackALZText extends StatelessWidget {
  const TrackALZText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: 'Track',
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        children: <InlineSpan>[
          TextSpan(
            text: 'ALZ',
            style: TextStyle(
                color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ]));
  }
}
