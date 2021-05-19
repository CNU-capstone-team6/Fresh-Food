import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InquirePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("참여업체 조회" ,
          textAlign: TextAlign.center,
        )),
        backgroundColor: Color(0xff6593F0),
      ),
      body: Center(
        child: Column(
          children: <Widget>[


            // RaisedButton(
            //   textColor: Colors.white,
            //   color: Colors.redAccent,
            //   child: Text('Back to Main Page'),
            //   onPressed: () {
            //     // TODO
            //   },
            // )
          ],
        ),
      ),
    );
  }
}