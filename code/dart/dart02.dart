// 1.使用final关键字定义常量
final height = 10;
// 2.使用const关键字定义常量
const pi = 3.14;


final time = new DateTime.now(); // 正确
//const time = new DateTime.now(); // 错误


// String 转 int
var one = int.parse('1');
// String 转 double
var onePointOne = double.parse('1.1');
// int 转 String
String oneAsStr = 1.toString();
// double 转 String
String piAsStr = 3.14159.toStringAsFixed(2); // 保留两位 '3.14'