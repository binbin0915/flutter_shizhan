import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:Tabs()
    );
  }
}


class Tabs extends StatefulWidget{
  Tabs();
  createState() => _TabsState();
}

class _TabsState extends State<Tabs>{
  List pages = [
    HomePage(),
    CatePage(),
    AboutPage()
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title:Text("老陈demo")),
      body:pages[_currentIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,//设置当前的tab索引值
        onTap: (int index){
          setState(() {
            this._currentIndex = index;
          });
        },//tab按钮的点击事件
        iconSize: 30,
        fixedColor: Colors.red,

        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("首页")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("分类")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("关于")
            )
        ] ,
      ),
    );
  }
}


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child:Text("这是home页")
    );
  }
}


class CatePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child:Text("这是分类页")
    );
  }
}

class AboutPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child:Text("这是关于页")
    );
  }
}