import 'dart:async';
import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/material.dart';

///数据总览的数据源
class DisplayData extends StatefulWidget {
  @override
  _DisplayData createState() => _DisplayData();
}

class _DisplayData extends State<DisplayData> {
  List<charts.Series> seriesList;
  bool animate;
  int num = 1;

  /// Creates a [LineChart] with sample data and no transition.
  @override
  void initState() {
    super.initState();
    this.animate = false;
    seriesList = _createRandomData(num);
    _initTimer();
  }

  ///定时器
  Timer _timer;

  ///定时器 - 1分钟
  void _initTimer() {
    if (_timer == null) {
      _timer = Timer.periodic(Duration(seconds: 3), (timer) {
        setState(() {
          num++;
          seriesList = _createRandomData(num);
          if (num > 27) {
            _timer.cancel();
          }
        });
      });
    }
  }

  /// Create random data.
  static List<charts.Series<SensorsData, int>> _createRandomData(int n) {
    print(n);
    Random random = new Random();

    List<SensorsData> Humidity1 = new List<SensorsData>();
    List<SensorsData> Humidity2 = new List<SensorsData>();
    List<SensorsData> Humidity3 = new List<SensorsData>();
    for (int i = 0; i < n && n < 27; i++) {
      Humidity1.add(new SensorsData(i, random.nextInt(100)));
      Humidity2.add(new SensorsData(i, random.nextInt(100)));
      Humidity3.add(new SensorsData(i, random.nextInt(100)));
    }
    print('当前数据list长度为:'+ Humidity1.length.toString());

    // Generate 2 shades of each color so that we can style the line segments.
    final blue = charts.MaterialPalette.blue.makeShades(1);
    final red = charts.MaterialPalette.red.makeShades(1);
    final green = charts.MaterialPalette.green.makeShades(1);

    return [
      new charts.Series<SensorsData, int>(
        id: ' Humidity1',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData y, _) => blue[0],
        domainFn: (SensorsData y, _) => y.time,
        measureFn: (SensorsData y, _) => y.y,
        data: Humidity1,
      ),
      new charts.Series<SensorsData, int>(
        id: ' Humidity2',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData y, _) => red[0],
        domainFn: (SensorsData y, _) => y.time,
        measureFn: (SensorsData y, _) => y.y,
        data: Humidity2,
      ),
      new charts.Series<SensorsData, int>(
        id: ' Humidity3',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData y, _) => green[0],
        domainFn: (SensorsData y, _) => y.time,
        measureFn: (SensorsData y, _) => y.y,
        data: Humidity3,
      )..setAttribute(charts.rendererIdKey, 'customPoint'),
    ];
  }

  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    final staticTicks = <charts.TickSpec<int>>[
      new charts.TickSpec(0, label: '00:00'),
      new charts.TickSpec(36, label: '06:00'),
      new charts.TickSpec(72, label: '12:00'),
      new charts.TickSpec(108, label: '18:00'),
      new charts.TickSpec(144, label: '23:59'),
    ];

    return new charts.LineChart(seriesList,
        defaultRenderer: new charts.LineRendererConfig(),
        customSeriesRenderers: [
          new charts.LineRendererConfig(customRendererId: "customPoint")
        ],
        domainAxis: new charts.NumericAxisSpec(
            tickProviderSpec:
                new charts.StaticNumericTickProviderSpec(staticTicks)),
        animate: animate);
  }
}

/// Sample linear data type.
class SensorsData {
  final int time;
  final int y;

  SensorsData(this.time, this.y);
}
