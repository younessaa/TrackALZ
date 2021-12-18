import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFB8B8B8).withOpacity(0.7),
          title: TrackALZText(),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/DetailsSemelle");
                },
                icon: Icon(
                  Icons.notifications,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        body: Wrap(
          children: [
            Row(
              children: [
                Container(
                  width: size.width * 0.5,
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 2,
                          color: Colors.black,
                          style: BorderStyle.solid),
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
                  )),
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
                  )),
                ),
              ],
            ),
            Container(
              height: 800,
              child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(34.00512779547252, -6.856329899485274),
                    zoom: 15.0,
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          "https://api.mapbox.com/styles/v1/younessaa/ckx90ituiahod14o36ai2g97e/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoieW91bmVzc2FhIiwiYSI6ImNreDh6N3Y5ZDB1YmUybm1uMWQ5NDFlOXEifQ.BL9saIFBLaZn4lruSIKnuw",
                      additionalOptions: {
                        'accessToken':
                            'pk.eyJ1IjoieW91bmVzc2FhIiwiYSI6ImNreDh6N3Y5ZDB1YmUybm1uMWQ5NDFlOXEifQ.BL9saIFBLaZn4lruSIKnuw',
                        'id': 'mapbox.mapbox-streets-v8'
                      },
                    ),
                  ]),
            ),
          ],
        ));
  }
}

class TrackALZText extends StatelessWidget {
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
