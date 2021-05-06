import 'package:earthsite/view/home_page/dataDisplay/dataDisplay_page.dart';
import 'package:earthsite/view/home_page/dataDisplay/display_chart_page.dart';
import 'package:earthsite/view/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:earthsite/view/home_page/alarm/alarm_page.dart';
import 'widgets/components/tabbar_item.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "土遗址",
      theme: ThemeData(
          primaryColor: Colors.green,//统一修改颜色
          highlightColor: Colors.transparent,//去掉高亮效果
          splashColor: Colors.transparent//去掉水波纹效果
      ),
      home:MyStackPage() ,
    );
  }
}
class MyStackPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyStatePageState();
  }
}

class MyStatePageState extends State<MyStackPage>{
  var _currentIndex=0;
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
        onTap: (int index){
          setState(() {
            _currentIndex=index;

          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          HomePage(),
          DataDisplayPage(),
          AlarmPage(),

        ],
      ),
    );
  }
}
