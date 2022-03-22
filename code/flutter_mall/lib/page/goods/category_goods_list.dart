import 'package:flutter/material.dart';
// 加载动画，支持多种常用的功能，效果非常酷炫
import 'package:flutter_spinkit/flutter_spinkit.dart';


import 'package:mall/service/goods_service.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/page/goods/goods_list.dart';
import 'package:mall/service/category_service.dart';
import 'package:mall/entity/category_title_entity.dart';

class CategoryListView extends StatefulWidget {
  String categoryName;
  int categoryId;

  CategoryListView(
      {Key key, @required this.categoryName, @required this.categoryId})
      : super(key: key);

  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView>
    with TickerProviderStateMixin {
  // 滚动控制器
  ScrollController _scrollController;
  // tab控制器
  TabController _tabController;
  // 加载商品数据
  GoodsService goodsService = GoodsService();
  // 类别数据获取
  CategoryService _categoryService = CategoryService();
  // 类别的实例
  CategoryTitleEntity _categoryTitleEntity;
  List<BrotherCategory> brotherCategory = List();
  var categoryFuture;
  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // 请求数据修改状态
    categoryFuture = _categoryService
        .getCategoryTitle({"id": widget.categoryId}, (categoryTitles) {
      _categoryTitleEntity = categoryTitles;
      brotherCategory = _categoryTitleEntity.brotherCategory;
      currentIndex = getCurrentIndex();
    }, (error) {});
  }

  getCurrentIndex() {
    for (int i = 0; i < brotherCategory.length; i++) {
      if (brotherCategory[i].id == _categoryTitleEntity.currentCategory.id) {
        return i;
      }
    }
  }

  @override
  void dispose() {
    // 销毁监听
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: categoryFuture,
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
            switch (asyncSnapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return SpinKitFoldingCube(
                  size: 40.0,
                  color: Colors.deepPurpleAccent,
                );
              default:
                if (asyncSnapshot.hasError)
                  return new Text(Strings.SERVER_EXCEPTION);
                else
                  _scrollController = ScrollController();
                _tabController = TabController(
                    initialIndex: currentIndex,
                    length: brotherCategory.length,
                    // 防止屏幕外动画
                    vsync: this)
                  ..addListener(() {});
                return getCategoryView();
            }
          }),
    );
  }

  Widget getCategoryView() {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        centerTitle: true,
        bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            indicatorColor: Colors.deepPurpleAccent,
            tabs: getTabBars()),
      ),
      body: TabBarView(
        children: getTabBarViews(),
        controller: _tabController,
      ),
    );
  }

  List<Widget> getTabBars() {
    List<Widget> tabBar = List();
    for (var category in brotherCategory) {
      tabBar.add(getTabBar(category));
    }
    return tabBar;
  }

  List<Widget> getTabBarViews() {
    List<Widget> tabBarView = List();
    for (var i = 0; i < brotherCategory.length; i++) {
      tabBarView.add(GoodsList(brotherCategory[i].id));
    }
    return tabBarView;
  }

  Widget getTabBar(BrotherCategory category) {
    return Tab(
      text: category.name,
    );
  }
}
