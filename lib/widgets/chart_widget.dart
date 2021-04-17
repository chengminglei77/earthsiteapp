import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:earthsite/view/home_page/dataDisplay/humidity_list_page.dart';
import 'package:earthsite/view/home_page/dataDisplay/humidity_page.dart';
import 'package:earthsite/view/home_page/dataDisplay/display_chart_page.dart';

class ChartWidget extends StatelessWidget {
  bool isButton;
  ChartWidget(@required this.isButton);

  String chartTitle = "5cm";
  String buttonTitle = "湿度传感器";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            constraints:
                BoxConstraints.tightFor(width: double.infinity, height: 50),
            child: isButton
                ? FlatButton(
                    child: Text(buttonTitle),
                    textColor: Colors.blue,
                    color: Colors.indigo,
                    onPressed: () {
                      //导航到新路由
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HumidityPage(1);
                      }));
                    },
                  )
                : Text(chartTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue, fontSize: 20))),
        Container(
          constraints: BoxConstraints.tightFor(width: 500, height: 250),
          child: isButton?DisplayChart.withRandomData():SegmentsLineChart.withRandomData(),
        )
      ],
    );
  }
}
