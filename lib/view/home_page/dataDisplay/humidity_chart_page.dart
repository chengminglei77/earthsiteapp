import 'package:earthsite/widgets/chart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///湿度传感器详细展示页面的表格
class HumidityChartPage extends StatefulWidget {
  const HumidityChartPage(this.type);
  final int type;

  @override
  _HumidityChartPageState createState() => _HumidityChartPageState(0);
}

class _HumidityChartPageState extends State<HumidityChartPage>
    with SingleTickerProviderStateMixin {
  int type;

  _HumidityChartPageState(this.type);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ChartWidget(false,'5cm'),
          ChartWidget(false,'10cm'),
          ChartWidget(false,'15cm'),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}


