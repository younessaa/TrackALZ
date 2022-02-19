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
  Position _currentPosition;
  Timer timer;
  Timer timer2;
  final SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = [];
  PermissionStatus _permissionSMS;
  String targetNumber = '+212708030126';
  double _endLatitude = 0;
  double _endLongitude = 0;
  double _startLatitude = 34.00512779547252;
  double _startLongitude = -6.856329899485274;

  @override
  void initState() {
    super.initState();
    _getSMS();
    timer = Timer.periodic(Duration(milliseconds: 10), (Timer t) => _getCurrentLocation());
    timer2 = Timer.periodic(Duration(milliseconds: 10), (Timer t) => _getSMS());
  }
  _getCurrentLocation() async {
    await Geolocator.requestPermission();
    Geolocator
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high, forceAndroidLocationManager: true)
      .then((Position position) {
        setState(() {
          _currentPosition = position;
          _startLatitude = position.latitude;
          _startLongitude = position.longitude;
        });
      }).catchError((e) {
        print(e);
      });
  }

  void _getSMS() async {
    await Permission.sms.request();
    _permissionSMS = await Permission.sms.status;
    if(_permissionSMS.isGranted){
      _messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: targetNumber,
        count: 10,
      );
      if(_messages.length != 0) {
      int index = _messages[0].body.indexOf('/');
      print(_messages[0].body + " " + index.toString());
      _endLatitude =  double.parse(_messages[0].body.substring(0, index ));
      _endLongitude =  double.parse(_messages[0].body.substring(index + 1));
    }
    }
    else{
      await Permission.sms.request();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    timer2?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
          leading: Builder(builder : (context) => GestureDetector(
                    child:  Center(child: Icon(
                      Icons.menu, //FontAwesomeIcons.alignLeft
                      color: Colors.black,
                      size: 30,
                    ),
                    ),
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
              )
            ),
          backgroundColor: Color(0xFFB8B8B8).withOpacity(0.7),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TrackALZText(),
              Icon(
                Icons.notifications,
                color: Colors.black,
                size: 30,
              ),
            ],
          )),
      body: DefaultTabController(
        length: 2,
        child: Wrap(
                children : [
                  TabBar(
                    indicatorColor: Colors.black,
                    indicatorWeight: 3,
                    tabs: [
                      Container(
                        width: size.width * 0.5,
                        padding: EdgeInsets.only(top: 12, bottom: 12),
                        child: Center(
                          child: Text(
                            "Map",
                            style: TextStyle(
                              color: Color(0xFF291F1F).withOpacity(0.8),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                      width: size.width * 0.5,
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: Center(
                        child: Text(
                          "Semelles",
                          style: TextStyle(
                            color: Color(0xFF291F1F).withOpacity(0.8),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ),
                    ),
                  ],
                ),
                Container(
                  height: size.height * 0.85,
                  child: TabBarView(
                      children: [
                        Container(
                          height: size.height * 0.8,
                          child: MapBox(_startLatitude, _startLongitude, _endLatitude, _endLongitude),
                        ),
                        ListView(
                          children: [
                            Semelle("Grand-mère", "assets/images/grandma.png", "Connecté"),
                            Semelle("Grand-père", "assets/images/grandfa.png", "Non-connecté"),
                          ]
                        ),
                    ]
                  ),
                )
                ]
              ),
      ),
    );
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
                color: Color(0xFFD80000), fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ]));
  }
}
