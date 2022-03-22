//布尔类型// Dart中的布尔类型用法同Java，与Java不同的是，布尔类型的默认值为null
bool flags;
bool flags1 = true;
// print(flags);    // null



//列表
// 创建列表
var list = [1, 2, 3];
// 下标从0开始。使用length可以访问list的长度
// print(list[0]);
// print(list.length);



main(List<String> args) {
  // 可以使用add添加元素
  list.add(5);
  // 可在list字面量前添加const关键字，定义一个不可改变的 列表（编译时常量）
  var constantList = const [1, 2, 3];
  //constantList[1] = 1;     // 报错
}
