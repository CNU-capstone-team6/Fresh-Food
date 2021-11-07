import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshfood/registration/registmain/components/body.dart';
import 'package:freshfood/home_page.dart';


class RegistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffBBD0ED),
      appBar: AppBar(
        title: Center(child: Text("유통과정 등록/수정" , textAlign: TextAlign.center,)),
        backgroundColor: Color(0xff6593F0),
        automaticallyImplyLeading: false,
        leading: IconButton (
          icon: Icon(Icons.first_page),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),

      ),
      body: Body(),
    );
  }
}