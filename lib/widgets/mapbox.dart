import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// ignore: must_be_immutable
class MapBox extends StatefulWidget {
  double startLatitude;
  double startLongitude;
  double endLatitude;
  double endLongitude;
  MapBox(this.startLatitude, this.startLongitude, this.endLatitude, this.endLongitude);

  @override
  _MapBoxState createState() => _MapBoxState();
}

class _MapBoxState extends State<MapBox> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(widget.startLatitude, widget.startLongitude),
        zoom: 15.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://api.mapbox.com/styles/v1/younessaa/ckx90ituiahod14o36ai2g97e/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoieW91bmVzc2FhIiwiYSI6ImNreDh6N3Y5ZDB1YmUybm1uMWQ5NDFlOXEifQ.BL9saIFBLaZn4lruSIKnuw",
          additionalOptions: {
            'accessToken' : 'pk.eyJ1IjoieW91bmVzc2FhIiwiYSI6ImNreDh6N3Y5ZDB1YmUybm1uMWQ5NDFlOXEifQ.BL9saIFBLaZn4lruSIKnuw',
            'id' : 'mapbox.mapbox-streets-v8'
          },
        ),
        MarkerLayerOptions(markers: [
          Marker(
            rotate: true,
            width: 45.0,
            height: 45.0,
            point: LatLng(widget.endLatitude, widget.endLongitude), 
            builder: (context) => Container(
              child: IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.red,
                iconSize: 45.0,
                onPressed: (){
                  print("Marker tapped");
                }
              ),
            ),
          ),
          Marker(
            width: 45.0,
            height: 45.0,
            point: LatLng(widget.startLatitude, widget.startLongitude), 
            builder: (context) => Container(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100.withOpacity(0.55),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    
                  ),
                  Center(
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      
                    ),
                  ),
              ]
              ),
            ),
          ),
        ])
      ]
    );
  }
}