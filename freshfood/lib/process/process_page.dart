import 'package:flutter/material.dart';

import 'components/body.dart';



class ProcessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffBBD0ED),
      appBar: AppBar(
        title: Center(child: Text("유통과정확인" , textAlign: TextAlign.center,)),
        backgroundColor: Color(0xff6593F0),
      ),
      body: Body(),
    );
  }
}