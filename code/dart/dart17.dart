// 关心具体异常，针对不同异常进行不同处理
// main(List<String> args) {
//   try {
//     // 使除数为0
//     print(11~/0);
//   } on IntegerDivisionByZeroException {
//     print("除数为0");
//   }on Exception{
//     print("Exception");
//   }finally {
//     print("finally");
//   }
  
// }

 
// main(List<String> args) {
//   // 不关心具体异常，只想捕获，避免异常继续传递
//   try {
//     print(11~/0);
//   } catch(e){
//     // 打印报错信息
//     print(e);
//   }finally {
//     print("finally");
//   }
// }



// main(List<String> args) {
//   // 获取更多异常信息，可以使用两个参数的catch，第二个参数是异常的调用栈信息
//   try {
//     print(11~/0);
//   } catch(e,s){
//     print(s);
//   }
// }



main(List<String> args) {
  // 想针对不同异常进行不同处理，还想打印调用栈信息
  try {
    print(11~/0);
  } on IntegerDivisionByZeroException catch(e,s){
    print(s);
  } on Exception catch(e,s){
    print(s);
  }
}