class  Logger {
    final String name;

    // 创建一个静态Map做为缓存
    static final Map<String, Logger> _cache =  <String, Logger>{};

    // 定义一个命名构造方法，用下划线"_"修饰，将构造方法私有化
    Logger._internal(this.name);

    // 使用关键字factory修饰类同名构造方法
    factory Logger(String name) {
        if (_cache.containsKey(name)) {
            return _cache[name];
        } else {
            // 调用命名构造方法创建新对象
            final logger= new  Logger._internal(name);
            _cache[name] = logger; // 存入缓存
            return logger;
        }
    }
}


void  main() {
    var uiLog = new Logger('UI');
    var eventLog = new Logger('event');
    var uiLog2 = new Logger('UI');
}
