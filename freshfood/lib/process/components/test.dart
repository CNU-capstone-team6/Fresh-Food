// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import 'package:qrscan/qrscan.dart' as scanner;
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//
// import 'package:permission_handler/permission_handler.dart';
//
// class ProcessPage extends StatefulWidget {
//   @override
//   _ProcessState createState() => _ProcessState();
//
// }
//
// class _ProcessState extends State<ProcessPage> {
//   String _output = 'Empty Scan Code';
//   @override
//   initState() {
//     super.initState();
//   }
//   Future _scanQR() async {
//     try {
//       String cameraScanResult = await scanner.scan();
//       setState(() {
//         _output = cameraScanResult; // setting string result with cameraScanResult
//       });
//     } on PlatformException catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffBBD0ED),
//       appBar: AppBar(
//         title: Center(child: Text("유통과정 확인",textAlign: TextAlign.center,)),
//         backgroundColor: Color(0xff6593F0),
//       ),
//       body: Center(
//         child: Text(_output), // Here the scanned result will be shown
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//           icon: Icon(Icons.camera_alt),
//           onPressed: () {
//             _scanQR(); // calling a function when user click on button
//           },
//           label: Text("Scan")),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
//
