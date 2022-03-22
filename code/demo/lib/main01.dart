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
        child: Text(
          'left center right nihaoleft center right nihaoleft center right nihaoleft center right nihao',
          textAlign: TextAlign.left,//left/center/right
          overflow: TextOverflow.ellipsis,//
          maxLines: 2,//设置最大行数
          textScaleFactor: 1,//设置文字的显示倍率
          style: TextStyle(
            color: Colors.red,
            // color: Color.fromARGB(255,100,255,0)
            fontSize: 30,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
            decorationColor: Colors.white,
            decorationStyle: TextDecorationStyle.dashed


            ),
          ),
        width: 300,
        height: 300,
        decoration:BoxDecoration(
          color: Colors.yellow,
          border: Border.all(
            color:Colors.blue,
            width:2
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))

        ) ,
        padding: EdgeInsets.all(20),
        // margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
        // transform: Matrix4.rotationZ(1),
        // alignment: Alignment.bottomLeft,
      ) ,
      
    );
  }
}