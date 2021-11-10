import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:freshfood/registration/contract_linking.dart';
import 'package:freshfood/registration/registmain/components/background.dart';
import 'package:freshfood/registration/registmain/regist_page.dart';
import 'package:freshfood/widget/icon_rounded_button.dart';
import 'package:provider/provider.dart';
import 'package:freshfood/registration/regist_page/componets/regist_after.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import '../../../home_page.dart';

class QrCode {
  final int _output;

  QrCode(this._output);
}
class Body extends StatefulWidget{
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body>{

  int _output= -1;
  List<ParseObject> results = <ParseObject>[];
  String author ="none";
  bool isCheck = false;
  String scanoutput="-1";
  void doUserQuery() async {
    final  currentUser = await ParseUser.currentUser();
    final QueryBuilder<ParseObject> parseQuery = QueryBuilder<ParseObject>(
        ParseObject('_User'));

    parseQuery..whereContains('objectId', currentUser.objectId);

    final ParseResponse apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      setState(() {
        results = apiResponse.results as List<ParseObject>;
      });
    } else {
      results = [];
    }
    author = results[0]['companyname'];

    isCheck = true;
  }

  @override
  Widget build(BuildContext context) {
    var contractLink = Provider.of<ContractLinking>(context);
    if (isCheck == false){
      doUserQuery();
    }
    Future _scanQR() async {
      String cameraScanResult = await scanner.scan();
      scanoutput = cameraScanResult;
      await contractLink.modifyFood(BigInt.from(int.parse(scanoutput)),author);

    }
    print("author $author");
    print("유저정보 ${results.length}");
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                    onPressed:() async {
                      _scanQR();
                      // if(scanoutput != -1){
                      //   showAlertDialog(context);
                      // }
                      Timer(Duration(seconds: 2),(){
                        showAlertDialog(context);// calling a function when user click on button
                      },
                      );
                    },
                    child: Image.asset( "assets/images/qr_click.JPG")
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return RegistPage();
            },
          ),
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("유통과정 추가"),
      content: Text("유통과정을 추가 완료하였습니다. "),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}