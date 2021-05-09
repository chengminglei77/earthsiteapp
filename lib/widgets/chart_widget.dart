import 'package:earthsite/view/home_page/dataDisplay/humidity_data.dart';
import 'package:earthsite/view/home_page/dataDisplay/windSpeed_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:earthsite/view/home_page/dataDisplay/humidity_page.dart';
import 'package:earthsite/view/home_page/dataDisplay/display_data.dart';
import 'package:earthsite/view/home_page/dataDisplay/windSpeed_page.dart';

///所有标题＋表格的模板组件封装
class ChartWidget extends StatefulWidget {
  bool isButton;
  String Title;
  String sensorId;
  bool isH;

  ChartWidget(
    @required this.isButton,
    @required this.Title,
    this.sensorId,
    this.isH,
  );

  @override
  _ChartWidgetState createState() =>
      _ChartWidgetState(isButton, Title, sensorId, isH);
}

class _ChartWidgetState extends State<ChartWidget> {
  bool isButton;
  String Title;
  String sensorId;
  bool isH;

  _ChartWidgetState(
    @required this.isButton,
    @required this.Title,
    this.sensorId,
    this.isH,
  );

  void Page() {
    if (Title == "湿度传感器") {
      //导航到新路由
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HumidityPage(1);
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
            child: isButton
                ? new DisplayData()
                : (isH
                    ? new HumidityData(sensorId)
                    : new WindSpeedData(sensorId)))
      ],
    );
  }
}
