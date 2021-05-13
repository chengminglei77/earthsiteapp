import 'package:earthsite/widgets/chart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///湿度传感器详细展示页面的表格
class HumidityChartPage extends StatefulWidget {
  const HumidityChartPage(this.type);
  final int type;

  @override
  _HumidityChartPageState createState() => _HumidityChartPageState(type);
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
          ChartWidget(false,'5cm','SDGW01DTU0201000800',true),
          ChartWidget(false,'10cm','SDGW01DTU0201000801',true),
          ChartWidget(false,'15cm','SDGW01DTU0201000802',true),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}


