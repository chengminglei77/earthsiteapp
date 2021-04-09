import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:earthsite/widgets/bottomnavigation.dart';

import 'home_page/dataDisplay/dataDisplay_page.dart';
import 'home_page/alarm/alarm_page.dart';
import 'home_page/home/home_page.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //final appBarTitles = ['首页', '项目', '公众号', '我的'];
  List<Widget> list = List();
  int _currentIndex = 0;
  var _body;

  @override
  void initState() {
    list
      ..add(HomePage())
      ..add(DataDisplayPage())
      ..add(AlarmPage());

    super.initState(); //无名无参需要调用
  }

  onTap(index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _body = IndexedStack(
      children: list,
      index: _currentIndex,
    );

    return Scaffold(
//      appBar: AppBar(
//        title: Text(appBarTitles[_currentIndex],
//            style: TextStyle(color: Colors.white)),
//        iconTheme: IconThemeData(color: Colors.white),
//        elevation: 0.1,
//      ),
      body: _body,
      bottomNavigationBar: BottomNavigationWidget(onTap),
    );
  }
}
