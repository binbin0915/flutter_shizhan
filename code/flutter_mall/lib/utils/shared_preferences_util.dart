// 轻量级数据存储模块，以键值对形式存储
import 'package:shared_preferences/shared_preferences.dart';
// 字符串常量
import 'package:mall/constant/string.dart';


// 定制项目需要用到数据存储的内容。
class SharedPreferencesUtils {
  static String token = "";
  // 获取保存的口令
  static Future getToken() async {
    if (token == null || token.isEmpty) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      token = sharedPreferences.getString(Strings.TOKEN) ?? null;
    }
    return token;
  }
  // 获取图片url地址
  static Future getImageHead() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(Strings.HEAD_URL);
  }
  // 获取用户名信息
  static Future getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(Strings.NICK_NAME);
  }
}
