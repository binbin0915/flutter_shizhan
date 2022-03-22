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
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("这是标题"),
              subtitle: Text("这是一个副标题"),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("这是标题"),
              subtitle: Text("这是一个副标题"),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("这是标题"),
              subtitle: Text("这是一个副标题"),
              trailing: Icon(Icons.arrow_right),
            )

          ],
        ),
        padding: EdgeInsets.all(20),
        
      ) ,
      
    );
  }
}