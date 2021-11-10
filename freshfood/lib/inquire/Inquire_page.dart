import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshfood/inquire/components/body.dart';

class InquirePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffBBD0ED),
      appBar: AppBar(
        title: Center(child: Text("참여업체 조회" ,
          textAlign: TextAlign.center,
        )),
        backgroundColor: Color(0xff6593F0),
      ),
      body: Body()
    );
  }
}