import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:trackalz/widgets/mapbox.dart';
import 'package:trackalz/widgets/semelle.dart';
import 'package:trackalz/widgets/drawer.dart';

class Home extends StatefulWidget {
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFB8B8B8).withOpacity(0.7),
          title: Center(
            child: Text("Ajouter une semelle"),
          ),
      ),
      body: Center(
        child: Column(
          children: [
            
          ],
        ),
      )
      );
  }
}
