import 'package:flutter/material.dart';
void main() => runApp(MyIndex());
class MyIndex extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'beline App',
      // home: HomePage(),
      initialRoute: "/",
      routes: {
        "/":(context)=>HomePage(),
        "/search":(context)=>SearchPage(),
        "/about":(context)=>AboutPage()
      },
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
              Navigator.pushNamed(context, "/search",arguments: "帅哥");
            },
          ),
          RaisedButton(
            child: Text("进入about页"),
            onPressed: (){
              Navigator.pushNamed(context, "/about");
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
        child:Text("搜索${ModalRoute.of(context).settings.arguments}页面的主体内容")
      ),
    );
  }
}


class AboutPage extends StatelessWidget{
  
  String msg;
  AboutPage({this.msg});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(title: Text("about页面")),
      body: Container(
        child:Text("about页面的主体内容")
      ),
    );
  }
}

