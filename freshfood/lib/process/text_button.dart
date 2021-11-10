import 'package:flutter/material.dart';
import 'package:freshfood/constants.dart';


class DetailButton extends StatelessWidget {
  final String copname;
  final String origin;
  final String itemname;
  final Function press;
  final Color color, textColor;

  const DetailButton({
    Key key,
    this.copname,
    this.origin,
    this.itemname,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white70,
      ),
      child: ClipRRect(

        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
              side : BorderSide(color: Colors.black)

          ),

          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: press,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  bottom: 4,
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(
                      color: Colors.blueAccent,  // Text colour here
                      width: 3.0, // Underline width
                    ))
                ),
                child: Text(
                  copname,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                itemname,
                style: TextStyle(color: textColor , fontSize: 14),
              ),
              Text(
                origin,
                style: TextStyle(color: textColor , fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}