import 'package:earthsite/widgets/chart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:earthsite/utils/net_utils.dart';

///湿度传感器详细展示页面的表格及其数据
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

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

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
    _refreshController.dispose();
    super.dispose();
  }
}

class SegmentsLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SegmentsLineChart(this.seriesList, {this.animate});

  factory SegmentsLineChart.withSampleData() {
    return new SegmentsLineChart(
      _humidityRandomData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  factory SegmentsLineChart.humidityRandomData() {
    return new SegmentsLineChart(_humidityRandomData());
  }

  static List<charts.Series<SensorsData, num>> _humidityRandomData() {
    final random = new Random();

    final colorChangeData = [
      new SensorsData(0, random.nextInt(100)),
      new SensorsData(1, random.nextInt(100)),
      new SensorsData(2, random.nextInt(100)),
      new SensorsData(3, random.nextInt(100)),
      new SensorsData(4, random.nextInt(100)),
      new SensorsData(5, random.nextInt(100)),
      new SensorsData(6, random.nextInt(100)),
      new SensorsData(7, random.nextInt(100)),
      new SensorsData(8, random.nextInt(100)),
      new SensorsData(9, random.nextInt(100)),
      new SensorsData(10, random.nextInt(100)),
      new SensorsData(11, random.nextInt(100)),
      new SensorsData(12, random.nextInt(100)),
      new SensorsData(13, random.nextInt(100)),
      new SensorsData(14, random.nextInt(100)),
      new SensorsData(15, random.nextInt(100)),
      new SensorsData(16, random.nextInt(100)),
      new SensorsData(17, random.nextInt(100)),
      new SensorsData(18, random.nextInt(100)),
      new SensorsData(19, random.nextInt(100)),
      new SensorsData(20, random.nextInt(100)),
      new SensorsData(21, random.nextInt(100)),
      new SensorsData(22, random.nextInt(100)),
      new SensorsData(23, random.nextInt(100)),
      new SensorsData(24, random.nextInt(100)),
      new SensorsData(25, random.nextInt(100)),
      new SensorsData(26, random.nextInt(100)),
      new SensorsData(27, random.nextInt(100)),
      new SensorsData(28, random.nextInt(100)),
      new SensorsData(29, random.nextInt(100)),
      new SensorsData(30, random.nextInt(100)),
    ];

    final blue = charts.MaterialPalette.blue.makeShades(1);

    return [
      new charts.Series<SensorsData, int>(
        id: 'Color Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData x, _) => blue[0],
        domainFn: (SensorsData y, _) => y.x,
        measureFn: (SensorsData y, _) => y.y,
        data: colorChangeData,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList,
        defaultRenderer:
            new charts.LineRendererConfig(includeArea: true, stacked: true),
        animate: animate);
  }
}

class SensorsData {
  final int x;
  final int y;

  SensorsData(this.x, this.y);
}
