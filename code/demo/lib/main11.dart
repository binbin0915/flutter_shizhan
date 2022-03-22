import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text("老陈 demo"),
        ),
        body: HomeContent(),
      )
    );
  }
}


class HomeContent extends StatelessWidget{
  List list = new List<Widget>();

  HomeContent(){
    for(var i = 0;i<20;i++){
      list.add(
        RaisedButton(
          child: Text('按钮${i}'),
          color: Colors.yellow,
          onPressed:(){}
        )
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.lightBlue,
      width: double.infinity,
      height: double.infinity,
      child:Wrap(
        direction: Axis.horizontal,
        children: this.list,
        spacing:10,
        runSpacing:30,
        alignment: WrapAlignment.center,//warp主轴分布
        runAlignment:WrapAlignment.spaceEvenly ,//多行分布
      )
    );
    
    
  }
}