import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshfood/inquire/widget/text_button.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class SearchPage extends StatefulWidget {

  final String items;
  final String copname;

  SearchPage({Key key, @required  this.items, this.copname }) : super(key: key);
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage>{



  List<ParseObject> results = <ParseObject>[];
  void getUserInfo() async {
    final QueryBuilder<ParseObject> parseQuery =QueryBuilder<ParseObject>(ParseObject('_User'));

    parseQuery
      ..whereContains('companyname', widget.copname)
      ..whereContains('items', widget.items);

    final ParseResponse apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      // Let's show the results
      // for (var o in apiResponse.results) {
      //   print((o as ParseObject).toString());
      // }
      setState(() {
        results = apiResponse.results as List<ParseObject>;
      });
    } else {
      results = [];
    }

  }

  @override
  Widget build(BuildContext context)  {
    Size size = MediaQuery.of(context).size;
    // print("items");
    // print("$items");
    // print("$copname");
    getUserInfo();
    print("resulte length ${results.length}");
    return Scaffold(
      backgroundColor: Color(0xffBBD0ED),
      appBar: AppBar(
        title: Center(child: Text("참여업체 조회 상세" , textAlign: TextAlign.center,)),
        backgroundColor: Color(0xff6593F0),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              // Text("$foodname"),
              // Text(foodorigin),
              // DetailButton(
              //   title: "제품 이름",
              //   text: "$foodname",
              //   textColor: Colors.black,
              //   color: Colors.white70,
              //   press: (){},
              //   // text : getList()
              //
              //   // style: TextStyle(fontSize: 15),
              // ),
              // DetailButton(
              //   title: "원산지",
              //   text: "$foodorigin",
              //   textColor: Colors.black,
              //   color: Colors.white70,
              //   press: (){},
              //
              //   // text : getList()
              //
              //   // style: TextStyle(fontSize: 15),
              // ),

              // Text(foodinfo),
              // FutureBuilder<List>(
              //     future: _fetch1() ,
              //     builder: (context,snapshot) {
              //       //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
              //       if (snapshot.hasData == false) {
              //         return CircularProgressIndicator();
              //       }
              //       //error가 발생하게 될 경우 반환하게 되는 부분
              //       // ignore: missing_return
              //       else if (snapshot.hasError) {
              //         return Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Text(
              //             'Error: ${snapshot.error}',
              //             style: TextStyle(fontSize: 15),
              //           ),
              //         );
              //       }
              //       // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
              //       else{
              //         List foodlist = snapshot.data ?? [];
              //         print("foodlist");
              //         print(foodlist);
              //         return Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: DetailButton(
              //             text : snapshot.data.toString(),
              //
              //
              //
              //             // style: TextStyle(fontSize: 15),
              //           ),
              //         );
              //       }
              //     })
            ],
          ),
        ),
      ),
    );

  }

}