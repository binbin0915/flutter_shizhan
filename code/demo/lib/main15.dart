import 'package:flutter/material.dart';
void main() => runApp(MyIndex());
class MyIndex extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'beline App',
      home: HomePage()
    );
  }
}


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title:Text("老陈首页")),
      body:Container(
        child:ListView(children: <Widget>[
          RaisedButton(
            child: Text("进入搜索页"),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context){
                    return SearchPage(msg:"美女");
                  }
                )
              );
            },
          )
        ],)
      ) ,
    );
  }
}

class SearchPage extends StatelessWidget{
  String msg;
  SearchPage({this.msg});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(title: Text("搜索页面")),
      body: Container(
        child:Text("搜索${this.msg}页面的主体内容")
      ),
    );
  }
}

