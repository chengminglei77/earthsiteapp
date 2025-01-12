
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:earthsite/widgets/chart_widget.dart';

///数据总览页面布局
class DisplayPage extends StatefulWidget {
  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("数据总览",style: TextStyle(color: Colors.black)),
        centerTitle: true, // 标题居中
      ),
      body:Column(
        children: [
          ChartWidget(true,'风速传感器',null),
          ChartWidget(true,'湿度传感器',null),
        ],
      ) ,
    );
  }
}
