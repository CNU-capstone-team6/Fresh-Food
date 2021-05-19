import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:freshfood/log_sign_page/login/login_page.dart';
import 'package:freshfood/log_sign_page/signin/components/background.dart';
import 'package:freshfood/log_sign_page/signin/components/or_divider.dart';
import 'package:freshfood/log_sign_page/welcome/welcom_page.dart';
import 'package:freshfood/log_sign_page/widget/already_have_account.dart';
import 'package:freshfood/log_sign_page/widget/rounded_button.dart';
import 'package:freshfood/log_sign_page/widget/rounded_input_field.dart';
import 'package:freshfood/log_sign_page/widget/rounded_password_field.dart';
import 'package:freshfood/log_sign_page/widget/text_field_container.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';


class Body extends StatelessWidget {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerBNumber = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundedInputField(
              hintText: "ID",
              controller:controllerUsername,
              keyboardType : TextInputType.text,
              labelText: "ID",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "E-mail",
              controller:controllerEmail,
              keyboardType : TextInputType.emailAddress,
              labelText: "E-mail",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: controllerPassword,
              labelText: "Password",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "사업자등록번호",
              controller: controllerBNumber,
              keyboardType : TextInputType.number,
              labelText: "사업자등록번호",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGN UP",
              press: () {
                doUserRegistration(context);
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
            ),
            // OrDivider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     SocalIcon(
            //       iconSrc: "assets/icons/facebook.svg",
            //       press: () {},
            //     ),
            //     SocalIcon(
            //       iconSrc: "assets/icons/twitter.svg",
            //       press: () {},
            //     ),
            //     SocalIcon(
            //       iconSrc: "assets/icons/google-plus.svg",
            //       press: () {},
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
  void showSuccess(BuildContext context)  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: const Text("User was successfully created!"),
          actions: <Widget>[
            new FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },

    );
  }

  void showError(String errorMessage,BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            new FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void doUserRegistration(BuildContext context) async {
    final username = controllerUsername.text.trim();
    final email = controllerEmail.text.trim();
    final password = controllerPassword.text.trim();
    final bnumber = int.parse(controllerBNumber.text.trim());
  
    // ParseObject parseObject = ParseObject("user");

    // var user =  ParseUser.createUser("TestFlutter", "TestPassword123", "TestFlutterSDK@gmail.com");

    final user = ParseUser.createUser(username, password, email)
    ..set("bnumber", bnumber);
    // var user = ParseUser().create("test", "test1", "test22");

    var response = await user.signUp();

    print(user);

    if (response.success) {
      // user = response.result;
      showSuccess(context);
    } else {
      showError(response.error.message,context);
    }
  }
}