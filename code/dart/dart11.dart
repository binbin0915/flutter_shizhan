// 命名构造方法
class  Person {
    String userName;
    int age;

    Person(this.userName, this.age);

    // 命名构造方法
    Person.fromData(Map data) {
        this.userName = data['name'];
        this.age = data['age'];
    }
}

void  main() {
    // 使用命名构造方法创建对象
    var p = new Person.fromData({
        "name":"Bob",
        "age":19
    });
    print(p.userName);
}