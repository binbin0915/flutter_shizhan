// Dart中也支持三目表达式
// condition ? expr1 : expr2

// 除此外，Dart还增加了非空条件判断符??
// expr1 ?? expr2

var str1 =  "Hello";
var str2 =  "world";
var result = str1 ?? str1.toUpperCase();


// 级联运算符可以在同一个对象上连续调用多个方法以及访问成员变量。
// new Person()..setName("Bob")..setAge(20)..save();


// 条件成员访问符
// 条件成员访问符?.
// list1默认值为null
List list1;
// print(list1?.length);  // null

List list2 = [];
// print(list2?.length);  // 0

// 条件分支
main(List<String> args) {
  var i = 0;
  if(i < 0){
    print('i < 0');
  }else if(i == 0){
    print('i = 0');
  } else {
    print('i > 0');
  } 

 // 在switch的case中可以使用整数、字符串、枚举类型和编译时常量
  String command = 'OPEN';
  switch (command) {
    case 'CLOSED':
      break;
    case 'OPEN':
      break;
    default:
      print('Default');
  }
}