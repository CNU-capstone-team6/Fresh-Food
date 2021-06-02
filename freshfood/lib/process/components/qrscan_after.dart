

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:freshfood/process/components/body.dart';
import 'package:freshfood/registration/contract_linking.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget{
  final String qrDetail;

  DetailPage({Key key, @required this.qrDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var contractLink = Provider.of<ContractLinking>(context);
    var foodinfo =contractLink.getFood(BigInt.from(int.parse(qrDetail)));
    return Scaffold(
      backgroundColor: Color(0xffBBD0ED),
      appBar: AppBar(
        title: Center(child: Text("상세사항" , textAlign: TextAlign.center,)),
        backgroundColor: Color(0xff6593F0),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(qrDetail),


            ],
          ),
        ),
      ),
    );
  }
}