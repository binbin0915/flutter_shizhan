// 类的继承
class Father {
    myFunction(){
        // do something
    }
}

class Son extends Father {

    @override
    myFunction(){
        super.myFunction();
        // do something
    }
}