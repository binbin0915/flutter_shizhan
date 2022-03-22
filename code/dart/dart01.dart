//main标准写法
// void main() {
//   print('Hello World!');//注意: Dart和Java一样表达式以分号结尾；
// }


//dart中void类型，作为函数返回值类型可以省略
// main() {
//   print('Hello World!');  
// }


//如果函数内部只有一个表达式，可以省略大括号，使用"=>"箭头函数; void main() => print('Hello World!');
//最简写形式
// main() => print('Hello World!');



main(List<String> args) {
  print(args);
  var hello = 'hello world';
  print(hello);


  // 主函数
  // 执行命令的放置到args
  /*多行注释 */
  ///文档注释，dart特有

 
  String name = "张三";
  num age = 18;


  var address = "广东广州";
//address = 123;//错误。使用var 来申明变量，会在赋值的时候将地址的类型进行确定。



  dynamic add = "1234";
  add = 1000;
  Object user = "老王";
  user = 1234;
}