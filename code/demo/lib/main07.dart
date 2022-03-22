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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child:Container(
        child:Flex(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,//设置主轴的分布
          crossAxisAlignment: CrossAxisAlignment.end,//设置侧轴分布
          direction:Axis.horizontal ,//设置主轴为水平方向
          children: <Widget>[
            // 固定大小子元素
            Container(
              width:100,
              height:100,
              color:Colors.blue
            ),
            Container(
              width:100,
              height:100,
              color:Colors.yellow
            ),
            // 弹性子元素
            Container(
              width:100,
              height:100,
              color:Colors.red
            )
          ],
        ),
        padding: EdgeInsets.all(20),
        height: 400,
        color: Colors.lightBlue,
        
      ) ,
      
    );
  }
}