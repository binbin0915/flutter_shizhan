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
        // child:Image.network(
        //   "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=412796477,2371228780&fm=111&gp=0.jpg",
        //   fit: BoxFit.fill,//拉伸宽高，cover，会进行裁切。fill，直接拉伸填充。contain。包含，会有空隙
        // ) ,

        child: Image.asset("assets/images/rock.png"),
        padding: EdgeInsets.all(20),
        width: 300,
        height: 400,
        // margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
        // transform: Matrix4.rotationZ(1),
        // alignment: Alignment.bottomLeft,
      ) ,
      
    );
  }
}