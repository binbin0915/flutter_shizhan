import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
//1、将需要的依赖配置到pubsepec.yaml
//2、导入需要用到的依赖

import 'package:mall/config/routers.dart';
import 'package:mall/config/application.dart';
// 配置路由

import 'package:mall/model/user_info.dart';
// 导入状态provider

void main() {
  runApp(ChangeNotifierProvider(
    builder: (context) => UserInfoModel(),
    child: MallApp(),
  ));
}

class MallApp extends StatelessWidget {
  MallApp() {
    final router = Router();
    Routers.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 去除右上角DEBUG标签
      debugShowCheckedModeBanner: false,
      // 路由配置
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(
        //顶部导航栏和状态栏颜色
        primaryColor: Colors.deepPurpleAccent,

      ),
    );
  }
}
