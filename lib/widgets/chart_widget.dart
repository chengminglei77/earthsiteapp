import 'package:flutter/cupertino.dart';

import 'package:earthsite/view/home_page/dataDisplay/humidity_list_page.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  String chartTitle = "5cm";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints:
              BoxConstraints.tightFor(width: double.infinity, height: 50),
          child: Text(chartTitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue,fontSize: 20)),
        ),
        Container(
          constraints: BoxConstraints.tightFor(width: 500, height: 250),
          child: SegmentsLineChart.withRandomData(),
        )
      ],
    );
  }
}
