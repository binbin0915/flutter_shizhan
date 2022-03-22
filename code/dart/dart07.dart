// 匿名函数
// 定义匿名函数，并将其赋值给一个变量func，注意，函数体最后的花括号处必须有分号结束。
// var func = (x,y){
//     return x + y;
// };
// print(func(10,11));    // 21
main(List<String> args) {
  print(func(10,11));
}



// 箭头函数
// add(num x, num y){
//     return x + y;
// }


// print(add(18,12));    // 30
// 与上面的普通函数完全等价
add(num x, num y) => x + y;
// print(add(18,12));    // 30


//箭头函数也可以与匿名函数结合，形成匿名箭头函数
var func = (num x, num y) => x + y;
