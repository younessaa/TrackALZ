import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({
    Key key,
    this.title,
    this.onPressLeading,
    this.onPressTrailing,
    this.iconLeading,
    this.iconTrailing,
    this.colorTilte,
    this.fontSizeTitle,
  })  : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  final Size preferredSize;
  final String title;
  final IconData iconLeading, iconTrailing;
  final Function onPressLeading;
  final Function onPressTrailing;
  final Color colorTilte;
  final double fontSizeTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: onPressLeading != null
            ? onPressLeading
            : () => Navigator.pop(context),
        icon: Icon(
          iconLeading != null ? iconLeading : FontAwesomeIcons.arrowLeft,
          color: Colors.black,
          size: 25,
        ),
      ),
      actions: [
        if (iconTrailing != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: onPressTrailing,
              icon: Icon(
                iconTrailing,
                color: Colors.black,
              ),
            ),
          )
      ],
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Montserrat',
          color: colorTilte ?? Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: fontSizeTitle ?? 23,
        ),
      ),
    );
  }
}