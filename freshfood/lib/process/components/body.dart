import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freshfood/process/components/background.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:freshfood/process/components/qrscan_after.dart';
import 'package:freshfood/registration/contract_linking.dart';
import 'package:provider/provider.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class QrDetail {
  // final List<String> foodlist;
  final String foodname;
  final String foodorigin;
  // final String _output;

  QrDetail(this.foodname,this.foodorigin);
}

class Body extends StatelessWidget {

  String _output="";
  String foodname ="";
  String foodorigin ="";
  // List<String> foodlist;

  @override
  Widget build(BuildContext context) {
    var contractLink = Provider.of<ContractLinking>(context);
    Size size = MediaQuery.of(context).size;

    Future _scanQR() async {
      String cameraScanResult = await scanner.scan();
      _output = cameraScanResult;
      List<List<String>> foodlist = await contractLink.getFood(BigInt.from(int.parse(_output)));
      print(foodlist);
      foodname = foodlist[0];
      foodorigin = foodlist[1];
      // try {
      //   String cameraScanResult = await scanner.scan();
      //   setState(() {
      //     _output = cameraScanResult; // setting string result with cameraScanResult
      //   });
      // } on PlatformException catch (e) {
      //   print(e);
      // }
    }
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                bottom: 8,
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                    color: Colors.blueAccent,  // Text colour here
                    width: 5.0, // Underline width
                  ))
              ),
              child: Text(
                "코드스캔",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                ),
              ),
            ),

            SizedBox(height: size.height * 0.12),
            FlatButton(
                onPressed:() async {
                  _scanQR();
                  Timer(Duration(seconds: 2),(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(context)=>DetailPage(foodname: foodname,foodorigin: foodorigin, ),
                      ),
                    );// calling a function when user click on button
                   },
                  );
                },
                child: Image.asset( "assets/images/qr_click.JPG")
            ),

            SizedBox(height: size.height * 0.05),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.blueAccent,
                      ),
                      Text(
                        "유통과정 확인방법",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "제품에 부착된 QR코드를 스캔하여 유통과정을 확인하세요.",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}

