import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:trackalz/widgets/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller = PageController();
  bool isShadowText = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
          leading: Builder(
              builder: (context) => GestureDetector(
                    child: Center(
                      child: Icon(
                        Icons.menu, //FontAwesomeIcons.alignLeft
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                  )),
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
      body: Wrap(children: [
        Row(
          children: [
            mapText(size),
            semellesText(size),
          ],
        ),
        Container(
          height: size.height * 0.85,
          child: PageView(
              onPageChanged: (i) {
                if (i == 0) {
                  setState(() {
                    isShadowText = true;
                  });
                } else {
                  setState(() {
                    isShadowText = false;
                  });
                }
              },
              controller: controller,
              children: [
                map(size),
                semelles(size),
              ]),
        )
      ]),
    );
  }

  Container mapText(Size size) {
    return Container(
      width: size.width * 0.5,
      padding: EdgeInsets.only(top: 12, bottom: 12),
      decoration: !isShadowText
          ? null
          : BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 2, color: Colors.black, style: BorderStyle.solid),
              ),
            ),
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              controller.animateToPage(
                0,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            });
          },
          child: Text(
            "Map",
            style: TextStyle(
              color: !isShadowText
                  ? Color(0xFF565656).withOpacity(0.8)
                  : Color(0xFF291F1F).withOpacity(0.8),
              fontSize: 24,
              fontWeight: FontWeight.bold,
              shadows: !isShadowText
                  ? []
                  : <Shadow>[
                      Shadow(
                        offset: Offset(0, 4),
                        blurRadius: 4.0,
                        color: Color(0xFF291F1F).withOpacity(0.25),
                      ),
                    ],
            ),
          ),
        ),
      ),
    );
  }

  Container semellesText(Size size) {
    return Container(
      width: size.width * 0.5,
      padding: EdgeInsets.only(top: 12, bottom: 12),
      decoration: isShadowText
          ? null
          : BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 2, color: Colors.black, style: BorderStyle.solid),
              ),
            ),
      child: Center(
          child: GestureDetector(
        onTap: () {
          setState(() {
            controller.animateToPage(
              1,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          });
        },
        child: Text(
          "Semelles",
          style: TextStyle(
            color: isShadowText
                ? Color(0xFF565656).withOpacity(0.8)
                : Color(0xFF291F1F).withOpacity(0.8),
            fontSize: 24,
            fontWeight: FontWeight.bold,
            shadows: isShadowText
                ? []
                : <Shadow>[
                    Shadow(
                      offset: Offset(0, 4),
                      blurRadius: 4.0,
                      color: Color(0xFF291F1F).withOpacity(0.25),
                    ),
                  ],
          ),
        ),
      )),
    );
  }

  ListView semelles(Size size) {
    return ListView(children: [
      GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/DetailsSemelle");
          },
          child: semelle(
              size, "Grand-mère", "assets/images/grandma.png", "Connecté")),
      GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/DetailsSemelle");
          },
          child: semelle(
              size, "Grand-père", "assets/images/grandfa.png", "Non-connecté")),
    ]);
  }

  Container semelle(
      Size size, String name, String imageUrl, String connectStatus) {
    return Container(
      height: size.height * 0.14,
      // width: size.width * 0.5,
      margin: EdgeInsets.only(left: 18, right: 18, bottom: 8, top: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFE5E5E5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              imageUrl,
              width: 86,
              height: 86,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Row(children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: connectStatus == "Connecté"
                        ? Color(0xFF4CB627)
                        : Color(0xFFFF0000),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 6,
                  ),
                  child: Container(
                    width: size.width * 0.3,
                    child: Text(
                      connectStatus,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF403D3D),
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: 4,
              ),
              Row(children: [
                Icon(
                  Icons.battery_std,
                  size: 24,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 6,
                  ),
                  child: Text(
                    "40%",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF403D3D),
                    ),
                  ),
                ),
              ]),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.arrow_right, //FontAwesomeIcons.angleRight,
                size: 40,
              ),
            ],
          )
        ],
      ),
    );
  }

  Container map(Size size) {
    return Container(
      height: size.height * 0.8,
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
                color: Color(0xFFD80000),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ]));
  }
}
