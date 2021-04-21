import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
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
  static List<charts.Series<SensorsData, int>> _createRandomData() {
    final random = new Random();

    // Series of data with static dash pattern and stroke width. The colorFn
    // accessor will colorize each datum (for all three series).
    final Humidity1 = [
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
    ];

    // Series of data with changing color and dash pattern.
    final Humidity2 = [
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
    ];

    // Series of data with changing color and stroke width.
    final Humidity3 = [
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
    ];

    // Generate 2 shades of each color so that we can style the line segments.
    final blue = charts.MaterialPalette.blue.makeShades(1);
    final red = charts.MaterialPalette.red.makeShades(1);
    final green = charts.MaterialPalette.green.makeShades(1);

    return [
      new charts.Series<SensorsData, int>(
        id: 'Color Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData y, _) => blue[0],
        domainFn: (SensorsData y, _) => y.time,
        measureFn: (SensorsData y, _) => y.y,
        data: Humidity1,
      ),
      new charts.Series<SensorsData, int>(
        id: 'Dash Pattern Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData y, _) => red[0],
        domainFn: (SensorsData y, _) => y.time,
        measureFn: (SensorsData y, _) => y.y,
        data: Humidity2,
      ),
      new charts.Series<SensorsData, int>(
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
    final staticTicks = <charts.TickSpec<int>>[
      new charts.TickSpec(
        // Value must match the domain value.
          0,
          // Optional label for this tick, defaults to domain value if not set.
          label: '01:00',
          // The styling for this tick.
          style: new charts.TextStyleSpec(
              color: new charts.Color(r: 0x4C, g: 0xAF, b: 0x50))),
      // If no text style is specified - the style from renderSpec will be used
      // if one is specified.
      new charts.TickSpec(6,label: '06:00'),
      new charts.TickSpec(12,label: '12:00'),
      new charts.TickSpec(18,label: '18:00'),
      new charts.TickSpec(23,label: '23:00'),
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
