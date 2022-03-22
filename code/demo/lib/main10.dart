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
        child:Stack(
          children:[
            Positioned(
              child: Container(color: Colors.red,width: 100,height: 100,),
              left: 200,
              top: 100,
            )
            ,
            Container(color: Colors.yellow,width: 80,height: 80,),
            Container(color: Colors.blue,width: 60,height: 60,)

          ]
        ),
        padding: EdgeInsets.all(20),
        height: 400,
        width: 400,
        color: Colors.lightBlue,
        
      ) ,
      
    );
  }
}