import 'package:flutter/material.dart';

import 'package:freshfood/registration/registmain/components/background.dart';
import 'package:freshfood/registration/modify/f_modify_page.dart';
import 'package:freshfood/registration/regist_page/f_regist_page.dart';
import 'package:freshfood/widget/icon_rounded_button.dart';
import 'package:web3dart/web3dart.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "환영합니다!",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            // SizedBox(height: size.height * 0.05),
            // SvgPicture.asset(
            //   "assets/icons/chat.svg",
            //   height: size.height * 0.45,
            // ),
            // SizedBox(height: size.height * 0.05),

          ],
        ),
      ),
    );
  }
}