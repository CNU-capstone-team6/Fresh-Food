import 'package:flutter/material.dart';
import 'package:freshfood/constants.dart';

class LoginCheck extends StatelessWidget {
  final bool login;
  final Function tab;
  final Function press;
  final Color color, textColor;

  const LoginCheck({
    Key key,
    this.login = true,
    this.press,
    this.tab,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: 14,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: press,
          // onTab : tab,
          child: Text(
            "Log out",
            // login ? "Log in" : "Log out",
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );

  }
}

