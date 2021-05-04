import 'package:earthsite/view/account/login_page.dart';
import 'package:earthsite/view/home_page/dataDisplay/Display_page.dart';
import 'package:earthsite/view/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:earthsite/view/home_page/alarm/alarm_page.dart';
import 'widgets/components/tabbar_item.dart';

//void main() {
//  runApp(OscWidget());
//}
//
//
//class OscWidget extends StatefulWidget {
//
//  @override
//  _OscWidgetState createState() => _OscWidgetState();
//}
//
//class _OscWidgetState extends State<OscWidget> {
//
//  @override
//  Widget build(BuildContext context) {
//    return // 全局配置子树下的SmartRefresher,下面列举几个特别重要的属性
//      RefreshConfiguration(
//          headerBuilder: () => WaterDropHeader(),
//          // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
//          footerBuilder: () => ClassicFooter(),
//          // 配置默认底部指示器
//          headerTriggerDistance: 80.0,
//          // 头部触发刷新的越界距离
//          /*springDescription:
//              SpringDescription(stiffness: 170, damping: 16, mass: 1.9),*/
//          // 自定义回弹动画,三个属性值意义请查询flutter api
//          maxOverScrollExtent: 100,
//          //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
//          maxUnderScrollExtent: 0,
//          // 底部最大可以拖动的范围
//          enableScrollWhenRefreshCompleted: true,
//          //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
//          enableLoadingWhenFailed: true,
//          //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
//          hideFooterWhenNotFull: false,
//          // Viewport不满一屏时,禁用上拉加载更多功能
//          enableBallisticLoad: true,
//          // 可以通过惯性滑动触发加载更多
//          child: MaterialApp(
//            debugShowCheckedModeBanner: false, //取出debug
//            theme: ThemeData(
//              // Add the 3 lines from here...
//              //primaryColor: themeColor,
//              platform: TargetPlatform.iOS, //右滑返回
//            ),
//            title: '土遗址',
//            home: DataDisplayPage(),
//          ));
//  }
//}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: "豆瓣App",
      theme: ThemeData(
          primaryColor: Colors.green, //统一修改颜色
          highlightColor: Colors.transparent, //去掉高亮效果
          splashColor: Colors.transparent //去掉水波纹效果
          ),
      home: LoginPage(),
    );
  }
}

class MyStackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyStatePageState();
  }
}

class MyStatePageState extends State<MyStackPage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
//        selectedItemColor: Colors.red,
//        unselectedItemColor: Colors.green,
        items: [
          TabBarItem("home", "首页"),
          TabBarItem("subject", "展示"),
          TabBarItem("group", "报警"),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          HomePage(),
          DisplayPage(),
          AlarmPage(),
        ],
      ),
    );
  }
}
