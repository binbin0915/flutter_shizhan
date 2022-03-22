import 'package:flutter/material.dart';
import 'package:mall/entity/home_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/widgets/cached_image.dart';

class CategoryMenu extends StatelessWidget {
  List<Channel> categoryList;

  CategoryMenu(this.categoryList);

  _goCategoryView(BuildContext context, Channel channel) {
    NavigatorUtils.goCategoryGoodsListPage(
        context, channel.name, channel.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.builder(
          // 禁止滑动和滚动
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        //  return _getGridViewItem(categoryList[index]);
        return _getGridViewItem(context, categoryList[index]);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //单个子Widget的水平最大宽度
        crossAxisCount: 4,
        //水平单个子Widget之间间距
        mainAxisSpacing: ScreenUtil.instance.setWidth(20.0),
        //垂直单个子Widget之间间距
        crossAxisSpacing: ScreenUtil.instance.setWidth(20.0),
      ),
    ));
  }

  Widget _getGridViewItem(BuildContext context, Channel channel) {
    return Center(
      child: InkWell(
        onTap: () => _goCategoryView(context, channel),
        child: Column(
          children: <Widget>[
            // 网络图片
            CachedImageView(ScreenUtil.instance.setWidth(60.0),
                ScreenUtil.instance.setWidth(60.0), channel.iconUrl),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(10.0)),
            ),
            Text(
              channel.name,
              style: TextStyle(
                // 设置适配屏幕的字体大小
                  fontSize: ScreenUtil.instance.setSp(26.0),
                  color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
