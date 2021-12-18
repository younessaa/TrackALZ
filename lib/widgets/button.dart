import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final Color color;
  final Color textColor;
  final String text;
  final double borderRadius;
  final Function onPressed;
  final IconData icon;
  final double sizeIcon;
  final Color iconColor;
  final double fontSize;

  const Button({
    this.color,
    @required this.text,
    this.borderRadius = 30,
    @required this.onPressed,
    this.icon,
    this.textColor,
    this.sizeIcon,
    this.fontSize,
    this.iconColor,
  });

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      onTapUp: _onTapUp,
      onTapDown: _onTapDown,
      onTap: widget.onPressed,
      child: Transform.scale(
        scale: _scale,
        child: Container(
          decoration: BoxDecoration(
              color: widget.color ?? Colors.white,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: Offset(0, 6),
                    blurRadius: 8)
              ]),
          constraints: BoxConstraints(
            maxWidth: 230,
            minHeight: 58,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.text,
                style: Theme.of(context).textTheme.headline4.copyWith(
                      color: widget.textColor ?? Color(0xffEA5850),
                      fontSize: widget.fontSize,
                    ),
              ),
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  color: widget.iconColor != null
                      ? widget.iconColor
                      : Theme.of(context).primaryColor,
                  size: widget.sizeIcon,
                ),
            ],
          ),
        ),
      ),
    );
  }
}