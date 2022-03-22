import 'package:flutter/material.dart';
// 加载指示器的组件
import 'package:flutter_spinkit/flutter_spinkit.dart';
// 屏幕适配模块
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingDialog extends StatefulWidget {
  @override
  _LoadingDialogState createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitFoldingCube(
          // 通过屏幕适配模块设置宽度
          size: ScreenUtil.instance.setWidth(60.0),
          color: Colors.deepPurpleAccent,
        ),
      ),
    );
  }
}
