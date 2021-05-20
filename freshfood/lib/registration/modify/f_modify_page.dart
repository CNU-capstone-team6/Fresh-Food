import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshfood/registration/modify/components/body.dart';

class f_ModifyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("유통과정 수정" ,
            textAlign: TextAlign.center,
          )),
          backgroundColor: Color(0xff6593F0),
        ),
        body: Body(),
    );
  }
}