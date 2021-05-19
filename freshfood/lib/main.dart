import 'package:flutter/material.dart';
import 'package:freshfood/home_page.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = 'wMJpY8CiemJm2RWiL3dWL2CC9MwkfSp3IDmn4zh8';
  final keyClientKey = 'DFa7wR10KoItUX3YtOIIjDmpm5L44aWdv5bsFrIB';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey,
      debug: true,
      autoSendSessionId: true,
      coreStore: await CoreStoreSembastImp.getInstance()
    );
  // var firstObject = ParseObject('FirstClass')
  // ..set(
  // 'message', 'Hey ! First message from Flutter. Parse is now connected');
  // await firstObject.save();

  print('done');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

