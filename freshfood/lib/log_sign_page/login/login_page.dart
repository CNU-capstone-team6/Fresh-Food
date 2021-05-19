import 'package:flutter/material.dart';
import 'package:freshfood/home_page.dart';
import 'package:freshfood/log_sign_page/login/components/body.dart' ;
import 'package:freshfood/log_sign_page/widget/login_check.dart';
import 'package:freshfood/log_sign_page/widget/rounded_button.dart';
import 'package:freshfood/log_sign_page/login/login_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffBBD0ED),
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(
                child: Text(
                  "참여업체 로그인" ,
                  textAlign: TextAlign.center,)
            ),
            Expanded(


              child: LoginCheck(
                // press: Body.isLoggedIn ? null : () => _Body.doUserLogout(context),
                tab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xff6593F0),
      ),
      body: Body(),
    );
  }
}