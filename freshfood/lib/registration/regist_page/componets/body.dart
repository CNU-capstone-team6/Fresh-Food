import 'package:flutter/material.dart';
import 'package:freshfood/registration/contract_linking.dart';

import 'package:freshfood/registration/registmain/components/background.dart';
import 'package:freshfood/widget/icon_rounded_button.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController originController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var contractLink = Provider.of<ContractLinking>(context);
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 29),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Food Name",
                        hintText: "Food Name",
                        icon: Icon(Icons.drive_file_rename_outline)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 29),
                  child: TextFormField(
                    controller: originController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Food Origin",
                        hintText: "Food Origin",
                        icon: Icon(Icons.drive_file_rename_outline)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),

                  child: ElevatedButton(
                    child: Text(
                      '등록',
                      style: TextStyle(fontSize: 30),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {
                      contractLink.addFood(BigInt.from(3),nameController.text,originController.text);
                      nameController.clear();
                      originController.clear();
                      // var result = contractLink.getFood(BigInt.from(3));
                      // print(result);
                      },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}