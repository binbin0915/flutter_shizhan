import 'package:flutter/material.dart';
import 'package:mall/entity/first_level_category.dart';
import 'package:mall/event/category_event.dart';
import 'package:mall/service/category_service.dart';

class FirstLevelCategoryView extends StatefulWidget {
  @override
  _FirstLevelCategoryViewState createState() => _FirstLevelCategoryViewState();
}

class _FirstLevelCategoryViewState extends State<FirstLevelCategoryView> {
  CategoryService categoryService = CategoryService();
  List<FirstLevelCategory> firstLevelLisCategorys = List();
  int _selectIndex = 0;

  @override
  void initState() {
    super.initState();
    categoryService.getCategoryData((firstLevelCategoryList) {
      eventBus.fire(CategoryEvent(firstLevelCategoryList[0].id,
          firstLevelCategoryList[0].name, firstLevelCategoryList[0].picUrl));
      setState(() {
        firstLevelLisCategorys = firstLevelCategoryList;
        // _getSubCategory();
      });
    });
    print("FirstLevelCategoryView_initState");
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: firstLevelLisCategorys.length,
            itemBuilder: (BuildContext context, int index) {
              return _getFirstLevelView(firstLevelLisCategorys[index], index);
            }));
  }
// 选择类别的操作
  _itemClick(int index) {
    setState(() {
      _selectIndex = index;
    });
    // 触发消息总线，通知所有监听CategoryEvent的方法。将类别ID和类别的名称和类别的图片
    eventBus.fire(CategoryEvent(
        firstLevelLisCategorys[index].id,
        firstLevelLisCategorys[index].name,
        firstLevelLisCategorys[index].picUrl));
    print("_itemClick");
  }

  Widget _getFirstLevelView(FirstLevelCategory firstLevelCategory, int index) {
    return GestureDetector(
      onTap: () => _itemClick(index),
      child: Container(
          width: 100.0,
          height: 50.0,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                height: 48,
                alignment: Alignment.center,
                child: Text(firstLevelCategory.name,
                    style: index == _selectIndex
                        ? TextStyle(
                            fontSize: 14.0, color: Colors.deepPurpleAccent)
                        : TextStyle(fontSize: 14.0, color: Colors.black54)),
              ),
              // 通过三元运算符实现，当元素的索引值和当前选中的值一致的时候，处于active的状态
              index == _selectIndex
                  ? Divider(
                      height: 2.0,
                      color: Colors.deepPurpleAccent,
                    )
                  : Divider(
                      color: Colors.white,
                      height: 1.0,
                    )
            ],
          )),
    );
  }
}
