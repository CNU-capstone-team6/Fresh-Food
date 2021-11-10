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
class Search{
  String copname;
  String items;
  String adress;
  int contact_inf;

  Search(this.copname,this.items,this.adress,this.contact_inf);
}
class SearchTile extends StatelessWidget{
  SearchTile(this._search);
  final Search _search;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: Icon(Icons.add_shopping_cart_outlined),
      title: Text(_search.copname),
      // subtitle: Text("${_person.age}세"),
      // isTreeLine: true,
      // trailing: PersonHandIcon(_person.isLeftHand),
    );
  }

}
class _SearchPage extends State<SearchPage>{

  List<DetailButton> buttonsList = new List<DetailButton>();
  List<ParseObject> results = <ParseObject>[];
  bool getInfo ;
  void getUserInfo() async {
      // results = [];
      if(getInfo != true) {
        print("if 실행완료");
        final QueryBuilder<ParseObject> parseQuery = QueryBuilder<ParseObject>(
            ParseObject('_User'));

        parseQuery..whereContains('companyname', widget.copname)..whereContains(
            'items', widget.items);

        final ParseResponse apiResponse = await parseQuery.query();

        if (apiResponse.success && apiResponse.results != null) {
          // results = apiResponse.results as List<ParseObject>;
          // Let's show the results
          // for (var o in apiResponse.results) {
          //   print((o as ParseObject).toString());
          // }
          print("sucess실행");
          setState(() {
            results = apiResponse.results as List<ParseObject>;
          });
        } else {
          results = [];
        }
        getInfo = true;
      }


  }

  List<Widget> buildButtons() {
    for (int i = 0; i < results.length; i++) {
      buttonsList
          .add(new DetailButton(copname: results[i]['companyname'], item: "품목: ${results[i]['items']}",adress: "주소: ${results[i]['adress']}",contact_inf: "연락처: ${results[i]['contact_inf'].toString()}", ));
    }
    return buttonsList;
  }

  @override
  Widget build(BuildContext context)  {
    Size size = MediaQuery.of(context).size;

    // if(getInfo == false) {
    //   print("getuserinfo 실행완료");
      getUserInfo();
    // }
    //   print("resulte length ${results.toString()}");
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
              children: buildButtons(),

            ),
          ),
        ),
      );
    }
  }
