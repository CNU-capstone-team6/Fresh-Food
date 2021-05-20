import 'package:flutter/material.dart';
import 'package:freshfood/registration/registmain/regist_page.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Function extends StatefulWidget {
  static bool isLoggedIn;

  @override
  _FunctionState createState() => _FunctionState();
}

class _FunctionState extends State<Function> {
  static final controllerUsername = TextEditingController();

  static final controllerPassword = TextEditingController();

   static bool isLoggedIn = false;


  @override
  Widget build(BuildContext context) {
    // This size provide us total height and width of our screen
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
}