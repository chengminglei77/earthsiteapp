import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:earthsite/bean/humidity_entity.dart';
import 'package:earthsite/constants/Urls.dart';
import 'package:earthsite/utils/HttpRequest.dart';

import 'package:flutter/material.dart';

///湿度传感器数据源
class HumidityData extends StatefulWidget {
  @override
  _HumidityData createState() => _HumidityData();
}

class _HumidityData extends State<HumidityData> {
  List<HumidityEntity> _humidityList = List();
  List<charts.Series> humidityList = List();
  bool animate;
  int num = 144;

  final staticTicks = <charts.TickSpec<int>>[
    new charts.TickSpec(0, label: '00:00'),
    new charts.TickSpec(36, label: '06:00'),
    new charts.TickSpec(72, label: '12:00'),
    new charts.TickSpec(108, label: '18:00'),
    new charts.TickSpec(144, label: '23:59'),
  ];

  @override
  void initState() {
    super.initState();
    this.animate = false;
    _getdataList();
    _initTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///定时器
  Timer _timer;

  ///定时器 - 1分钟
  void _initTimer() {
    if (_timer == null) {
      _timer = Timer.periodic(Duration(minutes: 10), (timer) {
        setState(() {
          _humidityList.clear();
          _getdataList();
        });
      });
    }
  }

  void _getdataList() {
    print("-------getData-------");
    HttpRequest.getInstance().get(Urls.data_url, successCallBack: (data) {
      List responseJson = json.decode(data);
      print("------responseData--------");
      List<HumidityEntity> chartList =
          responseJson.map((m) => new HumidityEntity.fromJson(m)).toList();
      setState(() {
        _humidityList.addAll(chartList);
        humidityList = _humidityData();
      });
    }, errorCallBack: (code, msg) {});
  }

  List<charts.Series<SensorsData, int>> _humidityData() {
    List<SensorsData> Humidity1 = new List<SensorsData>();
    for (int i = 0; i < _humidityList.length; i++) {
      if (_humidityList[i].Humidity1 != null) {
        Humidity1.add(new SensorsData(_humidityList[i].x, _humidityList[i].y));
      }
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
    return humidityList.length > 0
        ? new charts.LineChart(humidityList,
            defaultRenderer:
                new charts.LineRendererConfig(includeArea: true, stacked: true),
            domainAxis: new charts.NumericAxisSpec(
                tickProviderSpec:
                    new charts.StaticNumericTickProviderSpec(staticTicks)),
            animate: animate)
        : new Container(
            child: Text("等待数据中......"),
          );
  }
}

class SensorsData {
  final int time;
  final double y;

  SensorsData(this.time, this.y);
}
