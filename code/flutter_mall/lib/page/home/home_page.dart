import 'package:flutter/material.dart';
// 上拉刷新和下拉加载的组件
import "package:flutter_easyrefresh/easy_refresh.dart";
// 屏幕适配
import 'package:flutter_screenutil/flutter_screenutil.dart';
// 刷新的样式组件
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
// 下拉的样式组件
import 'package:flutter_easyrefresh/bezier_circle_header.dart';

// 首页的数据请求的模块
import 'package:mall/service/home_service.dart';
// 轮播组件
import 'package:mall/page/home/swiper.dart';
// 分类组件
import 'package:mall/page/home/category.dart';
import 'package:mall/constant/string.dart';
// 产品模块组件
import 'package:mall/page/home/new_product.dart';
// 路由跳转
import 'package:mall/utils/navigator_util.dart';
// 首页数据的实例对象
import 'package:mall/entity/home_entity.dart';
// 消息提示组件
import 'package:mall/utils/toast_util.dart';
// 加载动画的指示器
import 'package:mall/widgets/loading_dialog.dart';
// 品牌模块组件
import 'package:mall/page/home/brand.dart';
// 数据处理存储模块
import 'package:mall/utils/shared_preferences_util.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 请求获取首页的数据
  HomeService _homeService = HomeService();
  HomeEntity _homeEntity;
  // 刷新的控制器
  EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() {
    super.initState();
    SharedPreferencesUtils.getToken().then((token){

    });
    _queryHomeData();
  }

  _queryHomeData() {
    _homeService.queryHomeData((success) {
      setState(() {
        _homeEntity = success;
      });
      // 刷新结束、api
      _controller.finishRefresh();
    }, (error) {
      // 显示消息提示，将错误的消息提示显示出来
      ToastUtil.showToast(error);
      _controller.finishRefresh();
    });
  }

  // 点击进入搜索页面
  _goSearchGoods() {
    NavigatorUtils.goSearchGoods(context);
  }

  @override
  Widget build(BuildContext context) {
    // 屏幕适配=>小程序rpx=>rem
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
        //key: ObjectKey("home"),
        appBar: AppBar(
          title: Text(Strings.MALL),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                // 搜索按钮点击时候执行的函数
                onPressed: () => _goSearchGoods())
          ],
        ),
        body: contentWidget());
  }

  Widget contentWidget() {
    return _homeEntity == null
        ? LoadingDialog()
        : Container(
            child: EasyRefresh(
              controller: _controller,
              header: BezierCircleHeader(backgroundColor: Colors.deepOrange),
              footer: BezierBounceFooter(backgroundColor: Colors.deepOrange),
              enableControlFinishRefresh: true,
              enableControlFinishLoad: false,
              // 滚动组件
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  SwiperView(_homeEntity.banner, _homeEntity.banner.length,
                      ScreenUtil.instance.setHeight(360.0)),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  CategoryMenu(_homeEntity.channel),
                  Container(
                    height: 40.0,
                    alignment: Alignment.center,
                    child: Text(Strings.BRAND),
                  ),
                  // 品牌供应商组件
                  BrandView(_homeEntity.brandList),
                  Container(
                    height: 40.0,
                    alignment: Alignment.center,
                    child: Text(Strings.NEW_PRODUCT),
                  ),
                  ProductView(_homeEntity.newGoodsList),
                  //产品列表组件
                  Container(
                    height: 40.0,
                    alignment: Alignment.center,
                    child: Text(Strings.HOT_PRODUCT),
                  ),
                  ProductView(_homeEntity.hotGoodsList),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _homeEntity.floorGoodsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _floorGoodsWidget(_homeEntity.floorGoodsList[index]);
                      })
                ],
              )),
              onRefresh: () async {
                // 刷新数据
                _queryHomeData();
                // 取消loading
                _controller.finishRefresh();
              },
            ),
          );
  }

  Widget _floorGoodsWidget(FloorGoodsList floorGoods) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 40.0,
            alignment: Alignment.center,
            child: Text(floorGoods.name),
          ),
          ProductView(floorGoods.goodsList),
        ],
      ),
    );
  }
}
