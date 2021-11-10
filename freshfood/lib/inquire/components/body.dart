import 'package:flutter/material.dart';
import 'package:freshfood/inquire/components/background.dart';
import 'package:freshfood/inquire/widget/rounded_input_field.dart';
import 'package:freshfood/inquire/widget/rounded_button.dart';
import 'package:freshfood/inquire/components/Search_page.dart';

class Search {
  // final List<String> foodlist;
  final String items;
  final String copname;
  // final String _output;

  Search(this.items,this.copname);
}

class Body extends StatefulWidget{



  @override
  _Body createState() => _Body();
}
class _Body extends State<Body> {
  String items ="";
  String copname ="";
  final controllerItems = TextEditingController();
  final controllerCopName = TextEditingController();

  @override
  Widget build(BuildContext context) {
       return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundedInputField(
              // enabled: !isLoggedIn,
              hintText: "품목",
              controller: controllerItems,
              keyboardType: TextInputType.text,
              labelText: '품목',
              onChanged: (value) {},
            ),
            RoundedInputField(
              // enabled: !isLoggedIn,
              hintText: "업체명",
              controller: controllerCopName,
              keyboardType: TextInputType.text,
              labelText: '업체명',
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "검색",
              press: () {
                doSearch(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:(context)=>SearchPage(items: items,copname: copname, ),
                  ),
                );
              } ,
            ),
          ],
        ),
      ),
    );
  }

  void doSearch(BuildContext context) async {
    items = controllerItems.text.trim();
    copname = controllerCopName.text.trim();
    print("doSearh 실행");

  }
}
