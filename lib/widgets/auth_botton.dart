import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trackalz/global/size_config.dart';

class AuthButton extends StatelessWidget {
  AuthButton({
    @required this.icon,
    @required this.textButton,
    @required this.backgroundColor,
    @required this.colorText,
    @required this.function,
    Key key,
  }) : super(key: key);

  final Function function;
  final IconData icon;
  final String textButton;
  final Color backgroundColor;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 85,
      height: SizeConfig.blockSizeVertical * 6,
      child: TextButton(
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: SizeConfig.safeBlockHorizontal * 8,
                child: Center(child: FaIcon(icon)),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                width: 200,
                child: Text(
                  textButton,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ],
          ),
        ),
        style: TextButton.styleFrom(
          primary: colorText,
          backgroundColor: backgroundColor,
          elevation: 2,
          minimumSize: Size(100, 50),
          shadowColor: Colors.grey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: function,
      ),
    );
  }
}
