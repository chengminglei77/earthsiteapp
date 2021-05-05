import 'dart:async';
import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/material.dart';

///湿度传感器数据源
class HumidityData extends StatefulWidget {
  @override
  _HumidityData createState() => _HumidityData();
}
class _HumidityData extends State<HumidityData> {
  List<charts.Series> humidityList;
  bool animate;
  int num = 144;

  @override
  void initState() {
    super.initState();
    this.animate = false;
    humidityList = _humidityRandomData(num);
    //_initTimer();
  }

 /* ///定时器
  Timer _timer;

  ///定时器 - 1分钟
  void _initTimer() {
    if (_timer == null) {
      _timer = Timer.periodic(Duration(seconds: 3), (timer) {
        setState(() {
          num++;
          humidityList = _humidityRandomData(num);
          if (num > 144) {
            _timer.cancel();
          }
        });
      });
    }
  }*/


  static List<charts.Series<SensorsData, int>> _humidityRandomData(int n) {
    final random = new Random();

    List<SensorsData> Humidity1 = new List<SensorsData>();
    for (int i = 0; i < n; i++) {
      Humidity1.add(new SensorsData(i, random.nextInt(100)));
    }

    final blue = charts.MaterialPalette.blue.makeShades(1);

    return [
      new charts.Series<SensorsData, int>(
        id: 'Humidity1',
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

    return new charts.LineChart(humidityList,
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