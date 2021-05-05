import 'dart:async';
import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/material.dart';

///湿度传感器数据源
class HumidityData extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  HumidityData(this.seriesList, {this.animate});

  factory HumidityData.humidityRandomData() {
    return new HumidityData(_humidityRandomData());
  }

  static List<charts.Series<SensorsData, num>> _humidityRandomData() {
    final random = new Random();

    List<SensorsData> Humidity1 = new List<SensorsData>();
    for (int i = 0; i < 144; i++) {
      Humidity1.add(new SensorsData(i, random.nextInt(100)));
    }

    final blue = charts.MaterialPalette.blue.makeShades(1);

    return [
      new charts.Series<SensorsData, int>(
        id: 'Color Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData time, _) => blue[0],
        domainFn: (SensorsData y, _) => y.time,
        measureFn: (SensorsData y, _) => y.y,
        data: Humidity1,
      ),
    ];
  }

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
        defaultRenderer:
        new charts.LineRendererConfig(includeArea: true, stacked: true),
        domainAxis: new charts.NumericAxisSpec(
            tickProviderSpec:
            new charts.StaticNumericTickProviderSpec(staticTicks)),
        animate: animate);
  }
}

class SensorsData {
  final int time;
  final int y;

  SensorsData(this.time, this.y);
}