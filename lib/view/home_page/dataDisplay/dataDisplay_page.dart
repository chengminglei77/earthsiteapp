import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:earthsite/widgets/chart_widget.dart';

///数据总览页面布局
class DataDisplayPage extends StatefulWidget {
  @override
  _DataDisplayPageState createState() => _DataDisplayPageState();
}

class _DataDisplayPageState extends State<DataDisplayPage> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("数据总览",style: TextStyle(color: Colors.black)),
      ),
      body:Column(
        children: [
          ChartWidget(true),
          ChartWidget(true),
        ],
      ) ,
    );
  }

}
