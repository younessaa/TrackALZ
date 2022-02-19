import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Semelle extends StatefulWidget {
  final String name;
  final String imageUrl;
  bool connectStatus;
  Semelle(this.name, this.imageUrl, this.connectStatus);

  @override
  _SemelleState createState() => _SemelleState();
}

class _SemelleState extends State<Semelle> {
  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size;
    return GestureDetector(
      onTap : () {
        Navigator.pushNamed(context, "/DetailsSemelle");
      },
      child: Container(
        height: size.height * 0.14,
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
                widget.imageUrl,
                width: 86,
                height: 86,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4,),
                Row(
                  children : [
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: widget.connectStatus ? Color(0xFF4CB627) : Color(0xFFFF0000),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6,),
                      child: Container(
                        width: size.width * 0.3,
                        child: Text(
                        widget.connectStatus ? "Connecté" : "Non-connecté",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF403D3D),
                        ),
                  ),
                      ),
                    ),
                  ]
                ),
                SizedBox(height: 4,),
                Row(
                  children : [
                    Icon(
                      Icons.battery_std,
                      size: 24,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6,),
                      child: Text(
                      "40%",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF403D3D),
                      ),
                  ),
                    ),
                  ]
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.arrow_right,
                  size: 40,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
