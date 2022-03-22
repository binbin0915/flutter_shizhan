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

  List list = new List();
  HomeContent({Key key}):super(key:key){
    for(var i=0;i<10;i++){
      list.add("老陈真帅，第${i}帅");
    }
    print(list);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child:Container(
        child:ListView.builder(
          itemCount: this.list.length,
          itemBuilder: (context,index){
            return ListTile(
              leading: Icon(Icons.verified_user),
              title: Text("${list[index]}"),
              trailing:Icon(Icons.arrow_right) ,
            );
          }
        ),
        padding: EdgeInsets.all(20),
        
      ) ,
      
    );
  }
}