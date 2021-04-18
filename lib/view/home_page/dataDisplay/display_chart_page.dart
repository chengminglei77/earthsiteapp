import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

///数据总览的表格及其数据
class DisplayChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DisplayChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory DisplayChart.withSampleData() {
    return new DisplayChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory DisplayChart.withRandomData() {
    return new DisplayChart(_createRandomData());
  }

  /// Create random data.
  static List<charts.Series<SensorsData, DateTime>> _createRandomData() {
    final random = new Random();

    // Series of data with static dash pattern and stroke width. The colorFn
    // accessor will colorize each datum (for all three series).
    final Humidity1 = [
      new SensorsData(new DateTime(2017, 9, 19), random.nextInt(100)),
      new SensorsData(new DateTime(2017, 9, 26), random.nextInt(100)),
      new SensorsData(new DateTime(2017, 10, 3), random.nextInt(100)),
      new SensorsData(new DateTime(2017, 10, 10), random.nextInt(100)),
    ];

    // Series of data with changing color and dash pattern.
    final Humidity2 = [
      new SensorsData(new DateTime(2017, 9, 19), random.nextInt(100)),
      new SensorsData(new DateTime(2017, 9, 26), random.nextInt(100)),
      new SensorsData(new DateTime(2017, 10, 3), random.nextInt(100)),
      new SensorsData(new DateTime(2017, 10, 10), random.nextInt(100)),
    ];

    // Series of data with changing color and stroke width.
    final Humidity3 = [
      new SensorsData(new DateTime(2017, 9, 19), random.nextInt(100)),
      new SensorsData(new DateTime(2017, 9, 26), random.nextInt(100)),
      new SensorsData(new DateTime(2017, 10, 3), random.nextInt(100)),
      new SensorsData(new DateTime(2017, 10, 10), random.nextInt(100)),
    ];

    // Generate 2 shades of each color so that we can style the line segments.
    final blue = charts.MaterialPalette.blue.makeShades(1);
    final red = charts.MaterialPalette.red.makeShades(1);
    final green = charts.MaterialPalette.green.makeShades(1);

    return [
      new charts.Series<SensorsData, DateTime>(
        id: 'Color Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData y, _) => blue[0],
        domainFn: (SensorsData y, _) => y.time,
        measureFn: (SensorsData y, _) => y.y,
        data: Humidity1,
      ),
      new charts.Series<SensorsData, DateTime>(
        id: 'Dash Pattern Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData y, _) => red[0],
        domainFn: (SensorsData y, _) => y.time,
        measureFn: (SensorsData y, _) => y.y,
        data: Humidity2,
      ),
      new charts.Series<SensorsData, DateTime>(
        id: 'Stroke Width Change',
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
    return new charts.TimeSeriesChart(seriesList,
        defaultRenderer: new charts.LineRendererConfig(),
        customSeriesRenderers: [
          new charts.LineRendererConfig(customRendererId: "customPoint")
        ],
        animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<SensorsData, DateTime>> _createSampleData() {
    // Series of data with static dash pattern and stroke width. The colorFn
    // accessor will colorize each datum (for all three series).
    final Humidity1 = [
      new SensorsData(new DateTime(2021, 04, 17), 5),
      new SensorsData(new DateTime(2021, 04, 18), 15),
      new SensorsData(new DateTime(2021, 04, 19), 25),
      new SensorsData(new DateTime(2021, 04, 20), 75),
      new SensorsData(new DateTime(2021, 04, 21), 100),
      new SensorsData(new DateTime(2021, 04, 22), 90),
      new SensorsData(new DateTime(2021, 04, 23), 75),
    ];

    // Series of data with changing color and dash pattern.
    final Humidity2 = [
      new SensorsData(new DateTime(2021, 04, 17), 20),
      new SensorsData(new DateTime(2021, 04, 18), 30),
      new SensorsData(new DateTime(2021, 04, 19), 25),
      new SensorsData(new DateTime(2021, 04, 20), 75),
      new SensorsData(new DateTime(2021, 04, 21), 75),
      new SensorsData(new DateTime(2021, 04, 22), 100),
      new SensorsData(new DateTime(2021, 04, 23), 35),
    ];

    // Series of data with changing color and stroke width.
    final Humidity3 = [
      new SensorsData(new DateTime(2021, 04, 17), 5),
      new SensorsData(new DateTime(2021, 04, 18), 25),
      new SensorsData(new DateTime(2021, 04, 19), 30),
      new SensorsData(new DateTime(2021, 04, 20), 30),
      new SensorsData(new DateTime(2021, 04, 21), 75),
      new SensorsData(new DateTime(2021, 04, 22), 100),
      new SensorsData(new DateTime(2021, 04, 23), 90),
    ];

    // Generate 2 shades of each color so that we can style the line segments.
//    final blue = charts.MaterialPalette.blue.makeShades(2);
//    final red = charts.MaterialPalette.red.makeShades(2);
//    final green = charts.MaterialPalette.green.makeShades(2);

    return [
      new charts.Series<SensorsData, DateTime>(
        id: 'Color Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (SensorsData y, _) => y.time,
        measureFn: (SensorsData y, _) => y.y,
        data: Humidity1,
      ),
      new charts.Series<SensorsData, DateTime>(
        id: 'Dash Pattern Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (SensorsData y, _) => y.time,
        measureFn: (SensorsData y, _) => y.y,
        data: Humidity2,
      ),
      new charts.Series<SensorsData, DateTime>(
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
  final DateTime time;
  final int y;

  SensorsData(this.time, this.y);
}
