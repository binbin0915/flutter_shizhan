import 'package:flutter/material.dart';
void main() => runApp(MyIndex());
class MyIndex extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '表单App',
      home: HomePage(),
      
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePage();
  }
}

class _HomePage extends State<HomePage>{
  String msg = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title:Text("表单")),
      body: Container(
        child:Column(
          children:[
            TextField(
              decoration: InputDecoration(
                hintText: "请输入用户名",
                icon: Icon(Icons.people)
              ),
              onChanged: (value){
                setState(() {
                  this.msg = value;
                });
              },
            ),
            Text("表单的内容："+msg)
          ]
        ),
        padding: EdgeInsets.all(20) ,
      )
    );
  }
}