import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToastUtil {
  static showToast(String message) {
    Fluttertoast.showToast(
      // 提示消息组件
        msg: message,
        // 消息显示的提示时间
        toastLength: Toast.LENGTH_SHORT,
        // 位置
        gravity: ToastGravity.CENTER,
        // 展示时长，仅IOS有效
        timeInSecForIos: 1,
        // 背景颜色
        backgroundColor: Colors.deepPurpleAccent,
        // 文字颜色
        textColor: Colors.white,
        // 字体大小
        fontSize: ScreenUtil.instance.setSp(28.0));
  }
}
