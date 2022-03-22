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
        child:ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width:180,
              color:Colors.lightGreen
            ),
            Container(
              width:180,
              color:Colors.lightBlue
            ),
            Container(
              width:180,
              color:Colors.amber
            ),
            Container(
              width:180,
              color:Colors.yellow
            )

          ],
        ),
        padding: EdgeInsets.all(20),
        
      ) ,
      
    );
  }
}