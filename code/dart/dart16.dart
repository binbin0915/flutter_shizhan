// 接口抽象
abstract class Base {
    // 省略函数体即可定义抽象方法，不需加关键字
    func1();
    func2();
}


// 隐式接口
class People {
  void greet(){
    print("Hello");
  }
}


class Student implements People{
  @override
  void greet(){
    print("Hi,I'm Alice.");
  }
}


greet(People p){
  p.greet();
}


void main() {
  greet(new Student());
  // 泛型
  var names = new List<String>();
  names.add("zhangsan");


  var maps = new Map<int, String>();
  maps[1]="value";


  // 字面量写法
  var infos = <String>['Seth', 'Kathy', 'Lars'];


  var pages = <String, String>{
    'index.html': 'Homepage',
    'robots.txt': 'Hints for web robots'
  };
}




