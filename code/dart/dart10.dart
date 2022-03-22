// Dart中定义一个类
// class Person {
//   String name;
//   int age;

//   Person(String name, int age) {
//     this.name = name;
//     this.age = age;
//   }
// }



// Dart中定义一个类
// class  Person {
//     String name;
//     int age;

//     // 在构造方法中初始化成员变量时，可使用如下写法简化
//     // Person(this.name, this.age);

//     // 如需处理其他变量时，也可单独对其操作
//     Person(this.name, this.age, String address){
//         print(address);
//     }
//     // 注意，构造方法不能重载，以上注释掉
// }



// class  Person {
//     String userName;

//     Person(this.userName);

//     // 方法名前加get关键字
//     String get name{
//         return  "user:"  +  this.userName;
//     }

//     // 方法名前加set关键字
//     set name(String name){
//         // do something
//         this.userName = name;
//     }
// }

// void  main() {
//     var p = new Person("zhangsan");
//     print(p.name);   // user:zhangsan
//     p.name = "Jack";
//     print(p.name);   // user:Jack
// }


