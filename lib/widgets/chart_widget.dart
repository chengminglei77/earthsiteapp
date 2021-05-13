import 'package:earthsite/view/home_page/dataDisplay/sensor_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:earthsite/view/home_page/dataDisplay/humidity_page.dart';
import 'package:earthsite/view/home_page/dataDisplay/display_data.dart';
import 'package:earthsite/view/home_page/dataDisplay/windSpeed_page.dart';

///所有标题＋表格的模板组件封装
class ChartWidget extends StatefulWidget {
  bool isButton; //判断是否需要跳转
  String Title; //表头
  String sensorId; //传入传感器Id

  ChartWidget(
    this.isButton,
    this.Title,
    this.sensorId,
  );

  @override
  _ChartWidgetState createState() =>
      _ChartWidgetState(isButton, Title, sensorId);
}

class _ChartWidgetState extends State<ChartWidget> {
  bool isButton;
  String Title;
  String sensorId;


  _ChartWidgetState(
    this.isButton,
    this.Title,
    this.sensorId,
  );

  void Page() {
    if (Title == "湿度传感器") {
      //导航到新路由
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HumidityPage(0);
      }));
    } else {
      //导航到新路由
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WindSpeedPage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            constraints:
                BoxConstraints.tightFor(width: double.infinity, height: 50),
            child: isButton
                ? FlatButton(
                    child: Text(Title),
                    textColor: Colors.lightGreenAccent,
                    color: Colors.green,
                    onPressed: () {
                      Page();
                    },
                  )
                : Text(Title,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 20))),
        Container(
            constraints: BoxConstraints.tightFor(width: 500, height: 250),
            child: isButton ? new DisplayData() : new SensorData(sensorId))
      ],
    );
  }
}
