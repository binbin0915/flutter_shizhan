import 'package:flutter/material.dart';

// 首页组件
import 'package:mall/page/home/home_page.dart';
// 分类页组件
import 'package:mall/page/category/category.dart';
// 购物车组件
import 'package:mall/page/home/cart.dart';
// 个人中心组件
import 'package:mall/page/home/mine.dart';

// 导入字符串常量
import 'package:mall/constant/string.dart';



class MallMainView extends StatefulWidget {
  @override
  _MallMainViewState createState() => _MallMainViewState();
}

class _MallMainViewState extends State<MallMainView> {
  // _selectedIndex这个决定_list里面的哪个组件显示
  int _selectedIndex = 0;
  List<Widget> _list = List();
  // 文字的样式常量
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  @override
  void initState() {
    super.initState();
    // 将主页的四个组件放入进来，home页，分类页、购物车页、个人中心页
    _list
      ..add(HomePage())
      ..add(CategoryView())
      ..add(CartView())
      ..add(MineView());
  }
  // 定义方法去修改_selectedIndex选择了哪个底部导航
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 层布局控件,IndexedStack在同一时刻只能显示子控件中的一个控件
        body: IndexedStack(
          index: _selectedIndex,
          children: _list,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            // 首页按钮
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(Strings.HOME),
            ),
            // 分类按钮
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text(Strings.CATEGORY),
            ),
            // 购物车按钮
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text(Strings.SHOP_CAR),
            ),
            // 个人中心按钮
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text(Strings.MINE),
            ),
          ],
          currentIndex: _selectedIndex,//当前的索引值
          selectedItemColor: Colors.deepPurpleAccent,//选中的颜色
          unselectedItemColor: Colors.grey,//未选中时候的颜色
          onTap: _onItemTapped,//点击tabbar导航触发执行的函数
        ),
    );
  }
}
