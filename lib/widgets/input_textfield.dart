import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatefulWidget {
  InputTextField({
    Key key,
    this.hintText,
    this.visibility = false,
    this.controller,
    this.inputType,
    this.radius = 35,
    this.onchange,
    this.nbrLines,
    this.maxLength,
    this.labelText,
  }) : super(key: key);

  final String hintText;
  final String labelText;
  final bool visibility;
  final double radius;
  final TextInputType inputType;
  final TextEditingController controller;
  final Function onchange;
  final int nbrLines;
  final int maxLength;

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            right: 15,
            left: 25,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.4),
                spreadRadius: 0.5,
                blurRadius: 10,
                offset: Offset(0, 1),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          child: TextField(
            onChanged: widget.onchange,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              height: 1.8,
            ),
            maxLines: widget.nbrLines != null ? 3 : 1,
            minLines: 1,
            maxLength: widget.maxLength,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            keyboardType: widget.inputType,
            controller: widget.controller,
            cursorColor: Theme.of(context).primaryColor,
            obscureText: widget.visibility ? !this._passwordVisible : false,
            decoration: InputDecoration(
              suffixIcon: widget.visibility
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      icon: widget.visibility
                          ? (_passwordVisible
                              ? Icon(
                                  Icons.visibility,
                                  color: Theme.of(context).primaryColor,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: Theme.of(context).primaryColor,
                                ))
                          : Icon(null),
                    )
                  : null,
              hintText: widget.hintText,
              labelText: widget.labelText != null ? widget.labelText : null,
              labelStyle: TextStyle(
                fontFamily: 'Poppins',
                color: Theme.of(context).hoverColor,
                fontSize: 17,
              ),
              hintStyle: TextStyle(
                fontFamily: 'Poppins',
                color: Theme.of(context).hoverColor,
                fontSize: 17,
              ),
              border: InputBorder.none,
              counterText: "",
            ),
          ),
        ),
      ],
    );
  }
}
