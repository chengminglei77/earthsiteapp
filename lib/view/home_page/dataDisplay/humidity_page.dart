import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:earthsite/bean/classify_humidity_entity.dart';
import 'package:earthsite/view/home_page/dataDisplay/humidity_list_page.dart';

class HumidityPage extends StatefulWidget {
  int current; //控制当前tab索引
  HumidityPage(this.current);

  @override
  _HumidityPageState createState() => _HumidityPageState(0);
}

class _HumidityPageState extends State<HumidityPage>
    with SingleTickerProviderStateMixin {

  int index; //控制当前tab索引
  TabController _tabController;
  var isPageCanChanged = true;
  _HumidityPageState(this.index);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: index, length: humidity.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        //判断TabBar是否切换
        onPageChange(_tabController.index);
      }
    });
  }

  onPageChange(int index) async {
    _tabController.animateTo(index); //切换Tabbar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          tabs: humidity.map((Sensors h) {
            return Tab(
              text: h.Sensor,
            );
          }).toList(),
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: TextStyle(color: Colors.black, fontSize: 20),
          unselectedLabelStyle:
          TextStyle(color: Colors.grey, fontSize: 18),
          labelColor: Colors.white,
          labelPadding: EdgeInsets.all(5.0),
          indicatorPadding: EdgeInsets.all(0.0),
          indicatorWeight: 2.3,
          unselectedLabelColor: Colors.black,
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: humidity.map((Sensors h) {
            return Container(
              //margin: EdgeInsets.only(top: 300 * rpx),
              child: Padding(
                padding: EdgeInsets.only(
//                  left: duSetWidth(25),
//                  right: duSetWidth(25),
                ),
                child: HumidityListPage(h.type),
              ),
            );
          }).toList(),
      ),
    );
  }
}

class Sensors {
  const Sensors({
    this.Sensor,
    this.type,
  });

  final String Sensor;
  final int type;
}

const List<Sensors> humidity = const <Sensors>[
  const Sensors(Sensor: '湿度1', type: 0),
  const Sensors(Sensor: '湿度2', type: 1),
  const Sensors(Sensor: '湿度3', type: 2),
  const Sensors(Sensor: '湿度4', type: 3),
  const Sensors(Sensor: '湿度5', type: 4),
  const Sensors(Sensor: '湿度6', type: 5),
];
