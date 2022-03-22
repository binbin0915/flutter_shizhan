import 'package:flutter/material.dart';
import 'package:mall/constant/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// 商城图标
import 'package:mall/widgets/mall_icon.dart';
// 用户信息请求服务
import 'package:mall/service/user_service.dart';
// 消息提示
import 'package:fluttertoast/fluttertoast.dart';
// 用户实例对象
import 'package:mall/entity/user_entity.dart';
// 数据村粗
import 'package:shared_preferences/shared_preferences.dart';
// 路由导航
import 'package:mall/utils/navigator_util.dart';
// 登录的消息事件
import 'package:mall/event/login_event.dart';
import 'package:mall/utils/shared_preferences_util.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _accountTextControl = TextEditingController();
  TextEditingController _passwordTextControl = TextEditingController();
  UserService userService = UserService();
  UserEntity userEntity;
  bool _autovalidator = false;
  final registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Container(
            alignment: Alignment.centerLeft,
            child: Center(
                child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30.0), 0,
                    ScreenUtil().setWidth(30.0), 0),
                height: ScreenUtil.instance.setHeight(800.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Form(
                  key: registerFormKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              top: ScreenUtil.instance.setHeight(60.0))),
                      Container(
                        margin:
                            EdgeInsets.all(ScreenUtil.instance.setWidth(30.0)),
                        child: TextFormField(
                          maxLines: 1,
                          maxLength: 11,
                          // 是否自动校验
                          autovalidate: _autovalidator,
                          keyboardType: TextInputType.phone,
                          // 校验函数
                          validator: _validatorAccount,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.account_circle,
                              color: Colors.deepPurpleAccent,
                              size: ScreenUtil.instance.setWidth(60.0),
                            ),
                            hintText: Strings.ACCOUNT_HINT,
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: ScreenUtil.instance.setSp(28.0)),
                            labelStyle: TextStyle(
                                color: Colors.black54,
                                fontSize: ScreenUtil.instance.setSp(28.0)),
                            labelText: Strings.ACCOUNT,
                          ),
                          controller: _accountTextControl,
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.all(ScreenUtil.instance.setWidth(30.0)),
                        child: TextFormField(
                          maxLines: 1,
                          maxLength: 12,
                          obscureText: true,
                          autovalidate: _autovalidator,
                          validator: __validatorPassWord,
                          decoration: InputDecoration(
                            icon: Icon(
                              MallIcon.PASS_WORD,
                              color: Colors.deepPurpleAccent,
                              size: ScreenUtil.instance.setWidth(60.0),
                            ),
                            hintText: Strings.PASSWORD_HINT,
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: ScreenUtil.instance.setSp(28.0)),
                            labelStyle: TextStyle(
                                color: Colors.black54,
                                fontSize: ScreenUtil.instance.setSp(28.0)),
                            labelText: Strings.PASSWORD,
                          ),
                          controller: _passwordTextControl,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(
                              ScreenUtil.instance.setWidth(30.0)),
                          child: SizedBox(
                            height: ScreenUtil.instance.setHeight(80.0),
                            width: ScreenUtil.instance.setWidth(600.0),
                            child: RaisedButton(
                              // 绑定登录函数
                              onPressed: _login,
                              color: Colors.deepPurpleAccent,
                              child: Text(
                                Strings.LOGIN,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil.instance.setSp(28.0)),
                              ),
                            ),
                          )),
                      Container(
                        margin:
                            EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () => _register(),
                          child: Text(
                            // 马上注册按钮
                            Strings.NOW_REGISTER,
                            style: TextStyle(
                                color: Colors.deepPurpleAccent,
                                fontSize: ScreenUtil.instance.setSp(24.0)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ))),
      ),
    );
  }

  _register() {
    NavigatorUtils.goRegister(context);
  }
// 判断账号是否长度大于等于11
  String _validatorAccount(String value) {
    if (value == null || value.length < 11) {
      return Strings.ACCOUNT_RULE;
    }
    return null;
  }
// 判断密码长度是否小于6
  String __validatorPassWord(String value) {
    if (value == null || value.length < 6) {
      return Strings.PASSWORD_HINT;
    }
    return null;
  }

  _login() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      Map<String, dynamic> map = Map();
      map.putIfAbsent("username", () => _accountTextControl.text.toString());
      map.putIfAbsent("password", () => _passwordTextControl.text.toString());
      userService.login(map, (success) {
        print(success);
        userEntity = success;
        _saveUserInfo();
        _showToast(Strings.LOGIN_SUCESS);
//        Provider.of<UserInfoModel>(context, listen: true)
//            .updateInfo(userEntity);
        loginEventBus.fire(LoginEvent(true,url: userEntity.userInfo.avatarUrl,nickName: userEntity.userInfo.nickName));
        Navigator.pop(context);
      }, (onFail) {
        print(onFail);
        _showToast(onFail);
      });
    } else {
      setState(() {
        _autovalidator = true;
      });
    }
  }

// 消息提示
  _showToast(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.deepPurpleAccent,
        textColor: Colors.white,
        fontSize: ScreenUtil.instance.setSp(28.0));
  }

// 将用户信息进行保存
  _saveUserInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    SharedPreferencesUtils.token = userEntity.token;
    await sharedPreferences.setString(Strings.TOKEN, userEntity.token);
    await sharedPreferences.setString(
        Strings.HEAD_URL, userEntity.userInfo.avatarUrl);
    await sharedPreferences.setString(
        Strings.NICK_NAME, userEntity.userInfo.nickName);
  }
}
