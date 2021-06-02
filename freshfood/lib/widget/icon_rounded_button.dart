import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freshfood/constants.dart';


class IconRoundedButton extends StatelessWidget {
  final String text;
  final String imgpath;
  final Function press;
  final Color color, textColor;
  const IconRoundedButton({
    Key key,
    this.text,
    this.imgpath,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29),
            side : BorderSide(color: Colors.black)
          ),
          child:Container(

            decoration: BoxDecoration(

              image: DecorationImage(

                image: AssetImage(
                  imgpath,
                ),
                fit: BoxFit.fill,

                colorFilter: ColorFilter.mode(Colors.white54.withOpacity(0.15),BlendMode.dstATop),

              ),

              ),

            child:Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
              child: Text(
                text,
                style: TextStyle(color: textColor),
              ),
            ),
          ),
          color: color,
          onPressed: press,
        ),
      ),
    );
  }
}