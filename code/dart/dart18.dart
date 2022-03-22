// // 指定dart:前缀，表示导入标准库，如dart:io
// import 'dart:math';


// // 也可以用相对路径或绝对路径来引用dart文件
// import 'lib/student/student.dart';


// // 指定package:前缀，表示导入包管理系统中的库
// import 'package:utils/utils.dart';



// 异步编程
// 导入io库，调用sleep函数
import 'dart:io';


// 模拟耗时操作，调用sleep函数睡眠2秒
doTask() async{
  await sleep(const Duration(seconds:2));
  return "Ok";
}


// 定义一个函数用于包装
test() async {
  var r = await doTask();
  print(r);
}


void main(){
  print("main start");
  test();
  print("main end");
}