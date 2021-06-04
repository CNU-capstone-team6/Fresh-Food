import 'package:flutter/material.dart';
import 'package:freshfood/home_page.dart';
import 'package:freshfood/process/components/body.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RegistAfterPage extends StatelessWidget{

  final int qrCode;

  RegistAfterPage({Key key, @required this.qrCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffBBD0ED),
      appBar: AppBar(
        title: Center(child: Text("상세사항" , textAlign: TextAlign.center,)),
        backgroundColor: Color(0xff6593F0),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ),
                );
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        leadingWidth: 70,
        actions: [
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text("value is $qrCode"),

              QrImage(
                data: "$qrCode",
                version: QrVersions.auto,
                size: 200.0,
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.blueAccent,
                        ),
                        Text(
                          "유통과정 등록완료",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "제품에 해당 QR코드를 부착하세요.",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}