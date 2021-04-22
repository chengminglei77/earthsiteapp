import 'dart:async';
import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/material.dart';

///数据总览的表格及其数据
class DisplayChart extends StatefulWidget {
  @override
  _DisplayChart createState() => _DisplayChart();
}

class _DisplayChart extends State<DisplayChart> {
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
          if (num > 24) {
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
    for (int i = 0; i < n && n < 24; i++) {
      Humidity1.add(new SensorsData(i, random.nextInt(100)));
      Humidity2.add(new SensorsData(i, random.nextInt(100)));
      Humidity3.add(new SensorsData(i, random.nextInt(100)));
    }
    print(Humidity1.length);

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
      new charts.TickSpec(
        // Value must match the domain value.
        0,
        // Optional label for this tick, defaults to domain value if not set.
        label: '00:00',
      ),
      // If no text style is specified - the style from renderSpec will be used
      // if one is specified.
      new charts.TickSpec(6, label: '06:00'),
      new charts.TickSpec(12, label: '12:00'),
      new charts.TickSpec(18, label: '18:00'),
      new charts.TickSpec(23, label: '23:00'),
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

  /// Create one series with sample hard coded data.
  static List<charts.Series<SensorsData, int>> _createSampleData() {
    // Series of data with static dash pattern and stroke width. The colorFn
    // accessor will colorize each datum (for all three series).
    final Humidity1 = [
      new SensorsData(0, 5),
      new SensorsData(1, 15),
      new SensorsData(2, 25),
      new SensorsData(3, 75),
      new SensorsData(4, 100),
      new SensorsData(5, 90),
      new SensorsData(6, 75),
    ];

    // Series of data with changing color and dash pattern.
    final Humidity2 = [
      new SensorsData(0, 20),
      new SensorsData(1, 30),
      new SensorsData(2, 25),
      new SensorsData(3, 75),
      new SensorsData(4, 75),
      new SensorsData(5, 100),
      new SensorsData(6, 35),
    ];

    // Series of data with changing color and stroke width.
    final Humidity3 = [
      new SensorsData(0, 5),
      new SensorsData(1, 25),
      new SensorsData(2, 30),
      new SensorsData(3, 30),
      new SensorsData(4, 75),
      new SensorsData(5, 100),
      new SensorsData(6, 90),
    ];

    // Generate 2 shades of each color so that we can style the line segments.
//    final blue = charts.MaterialPalette.blue.makeShades(2);
//    final red = charts.MaterialPalette.red.makeShades(2);
//    final green = charts.MaterialPalette.green.makeShades(2);

    return [
      new charts.Series<SensorsData, int>(
        id: 'Color Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (SensorsData y, _) => y.time,
        measureFn: (SensorsData y, _) => y.y,
        data: Humidity1,
      ),
      new charts.Series<SensorsData, int>(
        id: 'Dash Pattern Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (SensorsData y, _) => y.time,
        measureFn: (SensorsData y, _) => y.y,
        data: Humidity2,
      ),
      new charts.Series<SensorsData, int>(
        id: 'Stroke Width Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (SensorsData y, _) => y.time,
        measureFn: (SensorsData y, _) => y.y,
        data: Humidity3,
      )..setAttribute(charts.rendererIdKey, 'customPoint'),
    ];
  }
}

/// Sample linear data type.
class SensorsData {
  final int time;
  final int y;

  SensorsData(this.time, this.y);
}
