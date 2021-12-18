import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trackalz/widgets/button.dart';

class DetailsSemelle extends StatelessWidget {
  const DetailsSemelle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              SellDetails(),
              SizedBox(
                height: 40,
              ),
              Divider(
                height: 2,
                thickness: 2,
                color: Color(0xff968C8C),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Ciblé",
                      style: TextStyle(
                        fontSize: 26,
                      ),
                    ),
                    AdvancedSwitch(
                      //controller: _controller,
                      activeColor: Colors.green,
                      inactiveColor: Color(0xff746E6E),
                      borderRadius: BorderRadius.all(const Radius.circular(30)),
                      width: 80.0,
                      height: 35.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Dernière position: \n33.568527,-6.268265",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Button(
                text: 'Visualiser la position',
                fontSize: 18,
                textColor: Colors.white,
                color: Color(0xffD64742),
                onPressed: () {},
              ),
              SizedBox(
                height: 30,
              ),
              Button(
                text: 'Supprimer l’appareil ',
                fontSize: 18,
                textColor: Colors.white,
                color: Color(0xff61BCD0),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//! TO show all details related to sell
class SellDetails extends StatelessWidget {
  const SellDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey,
      height: 150,
      child: Row(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.red,
          ),
          SizedBox(
            width: 60,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                "Grand-mére",
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    "Connecté",
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/svgs/batery_level.svg",
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "40 %",
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
