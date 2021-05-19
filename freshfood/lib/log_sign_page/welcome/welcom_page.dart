import 'package:flutter/material.dart';
import 'package:freshfood/log_sign_page/welcome/components/body.dart';
import 'package:freshfood/log_sign_page/widget/rounded_button.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xffBBD0ED),
        appBar: AppBar(
          title: Center(child: Text("참여업체 로그인" , textAlign: TextAlign.center,)),
          backgroundColor: Color(0xff6593F0),
        ),
        body: Body(),
      );
  }
}