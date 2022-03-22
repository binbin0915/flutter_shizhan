import 'package:flutter_swiper/flutter_swiper.dart';
// 轮播组件
import 'package:flutter/material.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/entity/home_entity.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/widgets/cached_image.dart';

class SwiperView extends StatelessWidget {
  List<MallBanner> bannerData = new List();
  int size;
  double viewHeight;

  SwiperView(this.bannerData, this.size, this.viewHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: viewHeight,
      width: double.infinity,
      child: bannerData == null || bannerData.length == 0
          ? Container(
              height: ScreenUtil.instance.setHeight(400.0),
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text(Strings.NO_DATA_TEXT),
            )
          : Swiper(
              onTap: (index) {
                // 点击轮播的具体内容时候，可以根据当前的索引值，获取到跳转的链接，实现页面的跳转
                NavigatorUtils.goWebView(
                    context, bannerData[index].name, bannerData[index].link);
              },
              itemCount: bannerData.length,
              scrollDirection: Axis.horizontal,
              //滚动方向，设置为Axis.vertical如果需要垂直滚动
              loop: true,
              //无限轮播模式开关
              index: 0,
              //初始的时候下标位置
              autoplay: false,
              itemBuilder: (BuildContext buildContext, int index) {
                print(bannerData[index].url);
                return LcImageView(
                    double.infinity, double.infinity, 'images/swiper${index+1}.jpg');
                // return CachedImageView( double.infinity, double.infinity, bannerData[index].url);
              },
              duration: 10000,
              // 轮播分页的组件设置
              pagination: SwiperPagination(
                // 放置到底部
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      size: 8.0,
                      // 尺寸大小颜色
                      color: Colors.white,
                      // 当前的颜色
                      activeColor: Colors.deepPurpleAccent)),
            ),
    );
  }
}
