

import 'package:flutter/material.dart';
import 'package:freshfood/log_sign_page/signin/components/body.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffBBD0ED),
      appBar: AppBar(
        title: Center(child: Text("회원가입" , textAlign: TextAlign.center,)),
        backgroundColor: Color(0xff6593F0),
      ),
      body: Body(),
    );
  }
}