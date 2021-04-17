import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

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
  static List<charts.Series<SensorsData, num>> _createRandomData() {
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
    ];

    // Generate 2 shades of each color so that we can style the line segments.
    final blue = charts.MaterialPalette.blue.makeShades(2);
    final red = charts.MaterialPalette.red.makeShades(2);
    final green = charts.MaterialPalette.green.makeShades(2);

    return [
      new charts.Series<SensorsData, int>(
        id: 'Color Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData y, _) =>
        y.x % 2 == 0 ? blue[1] : blue[0],
        domainFn: (SensorsData y, _) => y.x,
        measureFn: (SensorsData y, _) => y.y,
        data: Humidity1,
      ),
      new charts.Series<SensorsData, int>(
        id: 'Dash Pattern Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData y, _) =>
        y.x % 2 == 0 ? red[1] : red[0],
        domainFn: (SensorsData y, _) => y.x,
        measureFn: (SensorsData y, _) => y.y,
        data: Humidity2,
      ),
      new charts.Series<SensorsData, int>(
        id: 'Stroke Width Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData y, _) =>
        y.x % 2 == 0 ? green[1] : green[0],
        domainFn: (SensorsData y, _) => y.x,
        measureFn: (SensorsData y, _) => y.y,
        data: Humidity3,
      ),
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList,
        defaultRenderer:
        new charts.LineRendererConfig(includeArea: true, stacked: true),
        animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<SensorsData, int>> _createSampleData() {
    // Series of data with static dash pattern and stroke width. The colorFn
    // accessor will colorize each datum (for all three series).
    final colorChangeData = [
      new SensorsData(0, 5),
      new SensorsData(1, 15),
      new SensorsData(2, 25),
      new SensorsData(3, 75),
      new SensorsData(4, 100),
      new SensorsData(5, 90),
      new SensorsData(6, 75),
    ];

    // Series of data with changing color and dash pattern.
    final dashPatternChangeData = [
      new SensorsData(0, 5),
      new SensorsData(1, 15),
      new SensorsData(2, 25),
      new SensorsData(3, 75),
      new SensorsData(4, 100),
      new SensorsData(5, 90),
      new SensorsData(6, 75),
    ];

    // Series of data with changing color and stroke width.
    final strokeWidthChangeData = [
      new SensorsData(0, 5),
      new SensorsData(1, 15),
      new SensorsData(2, 25),
      new SensorsData(3, 75),
      new SensorsData(4, 100),
      new SensorsData(5, 90),
      new SensorsData(6, 75),
    ];

    // Generate 2 shades of each color so that we can style the line segments.
    final blue = charts.MaterialPalette.blue.makeShades(2);
    final red = charts.MaterialPalette.red.makeShades(2);
    final green = charts.MaterialPalette.green.makeShades(2);

    return [
      new charts.Series<SensorsData, int>(
        id: 'Color Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData y, _) =>
        y.x % 2 == 0 ? blue[1] : blue[0],
        domainFn: (SensorsData y, _) => y.x,
        measureFn: (SensorsData y, _) => y.y,
        data: colorChangeData,
      ),
      new charts.Series<SensorsData, int>(
        id: 'Dash Pattern Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData y, _) =>
        y.x % 2 == 0 ? red[1] : red[0],
        domainFn: (SensorsData y, _) => y.x,
        measureFn: (SensorsData y, _) => y.y,
        data: dashPatternChangeData,
      ),
      new charts.Series<SensorsData, int>(
        id: 'Stroke Width Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData y, _) =>
        y.x % 2 == 0 ? green[1] : green[0],
        domainFn: (SensorsData y, _) => y.x,
        measureFn: (SensorsData y, _) => y.y,
        data: strokeWidthChangeData,
      ),
    ];
  }

}

/// Sample linear data type.
class SensorsData {
  final int x;
  final int y;

  SensorsData(this.x, this.y);
}