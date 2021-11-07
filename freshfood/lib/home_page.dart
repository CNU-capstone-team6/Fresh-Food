import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:freshfood/inquire/Inquire_page.dart';
import 'package:freshfood/introduce_page.dart';
import 'package:freshfood/log_sign_page/login/login_page.dart';
import 'package:freshfood/log_sign_page/widget/rounded_button.dart';
import 'package:freshfood/process/process_page.dart';
import 'package:freshfood/widget/icon_rounded_button.dart';

import 'log_sign_page/welcome/welcom_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffBBD0ED),
      // appBar: AppBar(
      //   title: Center(child: Text("Fresh Food", textAlign: TextAlign.center,)),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.1),
          // SvgPicture.asset(
          //   "assets/icons/login.svg",
          //   height: size.height * 0.30,
          // ),
          SizedBox
            (height: size.height * 0.30,
              // width: 200,
              child: Image.asset( "assets/images/main_name.png")),
          new Expanded(
            child: GridView.count(
                primary: false,
                padding: EdgeInsets.all(20.0),
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,

                children: <Widget>[
                  // RaisedButton(
                  //   textColor: Colors.black,
                  //   color: Colors.white54,
                  //   child: Text('유통과정 확인'),
                  //   onPressed: () {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => ProcessPage()));
                  //   },
                  // ),
                  // RaisedButton(
                  //   textColor: Colors.black,
                  //   color: Colors.white54,
                  //   child: Text('참여업체 조회'),
                  //   onPressed: () {
                  //     // navigateToSubPage("login");
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (login) => InquirePage()));
                  //   },
                  // ),
                  // RaisedButton(
                  //   textColor: Colors.black,
                  //   color: Colors.white54,
                  //   child: Text('프레시 푸드 소개'),
                  //   onPressed: () {
                  //     // navigateToSubPage("login");
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (login) => IntroducePage()));
                  //   },
                  // ),
                  // RaisedButton(
                  //   textColor: Colors.black,
                  //   color: Colors.white54,
                  //   child: Text('로그인'),
                  //   onPressed: () {
                  //     // navigateToSubPage("login");
                  //     Navigator.push(
                  //         context, MaterialPageRoute(builder: (context) => WelcomePage()));
                  //   },
                  // ),

                  IconRoundedButton(
                    textColor: Colors.black,
                    color: Colors.white54,
                    text: "유통과정 확인",
                    imgpath: "assets/images/main_process.png",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProcessPage();
                          },
                        ),
                      );
                    },
                  ),
                  IconRoundedButton(
                    textColor: Colors.black,
                    color: Colors.white54,
                    text: "참여업체 조회",
                    imgpath: "assets/images/main_inquire.png",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return InquirePage();
                          },
                        ),
                      );
                    },
                  ),
                  IconRoundedButton(
                    textColor: Colors.black,
                    color: Colors.white54,
                    text: "프레시푸드 소개",
                    imgpath: "assets/images/main_intro.png",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return IntroducePage();
                          },
                        ),
                      );
                    },
                  ),
                  IconRoundedButton(
                    textColor: Colors.black,
                    color: Colors.white54,
                    text: "로그인",
                    imgpath: "assets/images/main_login.png",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return WelcomePage();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}