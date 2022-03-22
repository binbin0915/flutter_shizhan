// 首先定义三个父类
class Father1 {
    a(){
      print("this is a func");
    }

    common(){
        print("common Father1");
    }
}

class Father2 {
    b(){
      print("this is b func");
    }

    common(){
        print("common Father2");
    }
}

class Father3 {
    c(){
      print("this is c func");
    }

    common(){
        print("common Father3");
    }
}

//定义子类
class Son extends Father1 with Father2,Father3{

}
// 以上继承写法中，也可以直接使用with
// class Son with Father1,Father2,Father3{
// }

void main() {
  var obj = new Son();
  obj.common();
  obj.a();
  obj.b();
  obj.c();
}