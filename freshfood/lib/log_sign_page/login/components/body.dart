import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freshfood/log_sign_page/login/components/background.dart';
import 'package:freshfood/log_sign_page/signin/signin_page.dart';
import 'package:freshfood/log_sign_page/widget/already_have_account.dart';
import 'package:freshfood/log_sign_page/widget/rounded_button.dart';
import 'package:freshfood/log_sign_page/widget/rounded_input_field.dart';
import 'package:freshfood/log_sign_page/widget/rounded_password_field.dart';
import 'package:freshfood/registration/registmain/regist_page.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';



class Body extends StatefulWidget{
  @override
  _Body createState() => _Body();
}


class _Body extends State<Body> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  bool isLoggedIn = false;
  // const Body({
  //   Key key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // bool isLoggedIn;
    return Background(

      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "LOGIN",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            // SizedBox(height: size.height * 0.03),
            // SvgPicture.asset(
            //   "assets/icons/login.svg",
            //   height: size.height * 0.35,
            // ),
            // SizedBox(height: size.height * 0.03),
            RoundedInputField(
              enabled: !isLoggedIn,
              hintText: "ID",
              controller: controllerUsername,
              keyboardType: TextInputType.text,
              labelText: 'ID',
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: controllerPassword,
              enabled: !isLoggedIn,

              labelText: 'Password',

              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOG IN",
              press:  isLoggedIn ? null : () => doUserLogin(context),
            ),
            RoundedButton(
              text: "LOG OUT",
              press: !isLoggedIn ? null : () => doUserLogout(context),
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
  void showSuccess(String message,BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            new FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistPage()),
                );
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

  void doUserLogin(BuildContext context) async {
    final username = controllerUsername.text.trim();
    final password = controllerPassword.text.trim();

    final user = ParseUser(username, password, null);

    var response = await user.login();

    if (response.success) {
      showSuccess("User was successfully login!",context);
      setState(() {
        isLoggedIn = true;
      });

    } else {
      showError(response.error.message,context);
    }


  }

  void doUserLogout(BuildContext context) async {
    final user = await ParseUser.currentUser();
    var response = await user.logout();
    if (response.success) {
      showSuccess("User was successfully logout!",context);
      setState(() {
        isLoggedIn = false;
      });
    } else {
      showError(response.error.message,context);
    }
  }
}