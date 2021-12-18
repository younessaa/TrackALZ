import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trackalz/global/size_config.dart';

class Background extends StatelessWidget {
  const Background({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: SizeConfig.blockSizeVertical * 100,
        width: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(
                "assets/svgs/Path1.svg",
                width: double.infinity,
                height: 290,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                "assets/svgs/Path2.svg",
                width: double.infinity,
                height: 137,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
