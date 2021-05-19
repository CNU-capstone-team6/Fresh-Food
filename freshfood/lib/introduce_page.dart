import 'package:flutter/material.dart';

class IntroducePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("사용설명서" , textAlign: TextAlign.center,)),
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