import 'package:flutter/cupertino.dart';

import 'package:earthsite/view/home_page/dataDisplay/humidity_list_page.dart';

class ChartWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
            constraints: BoxConstraints.tightFor(width: 500, height: 50),
            child:Text("5cm")
        ),
        Container(
          constraints: BoxConstraints.tightFor(width: 500, height: 250),
          child: SegmentsLineChart.withRandomData(),
        )
      ],
    );
  }
}