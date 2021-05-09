import 'dart:async';
import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:earthsite/bean/windSpeed_entity.dart';
import 'package:earthsite/constants/Urls.dart';
import 'package:earthsite/utils/HttpRequest.dart';

import 'package:flutter/material.dart';

///湿度传感器数据源
class WindSpeedData extends StatefulWidget {
  String sensorId;

  WindSpeedData(
    this.sensorId,
  );

  @override
  _WindSpeedData createState() => _WindSpeedData(sensorId);
}

class _WindSpeedData extends State<WindSpeedData> {
  String sensorId;

  _WindSpeedData(
    this.sensorId,
  );

  List<WindSpeedEntity> _windSpeedList = List();
  List<charts.Series> windSpeedList = List();
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
          _windSpeedList.clear();
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
      List<WindSpeedEntity> chartList =
          responseJson.map((m) => new WindSpeedEntity.fromJson(m)).toList();
      setState(() {
        _windSpeedList.addAll(chartList);
        if (sensorId == "FSGW01DTU0302000100") {
          windSpeedList = _windSpeedData1();
        } else if (sensorId == "FSGW01DTU0102000200") {
          windSpeedList = _windSpeedData2();
        } else if (sensorId == "FSGW01DTU0402010100") {
          windSpeedList = _windSpeedData3();
        } else if (sensorId == "FSGW01DTU0402010200") {
          windSpeedList = _windSpeedData4();
        }else
          windSpeedList = _windSpeedData1();
      });
    }, errorCallBack: (code, msg) {});
  }

  List<charts.Series<SensorsData, int>> _windSpeedData1() {
    List<SensorsData> WindSpeed1 = new List<SensorsData>();
    for (int i = 0; i < _windSpeedList.length; i++) {
      if (_windSpeedList[i].WindSpeed1 != null) {
        WindSpeed1.add(new SensorsData(_windSpeedList[i].x, _windSpeedList[i].y));
      }
    }

    final blue = charts.MaterialPalette.blue.makeShades(1);

    return [
      new charts.Series<SensorsData, int>(
        id: 'WindSpeed1',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData time, _) => blue[0],
        domainFn: (SensorsData y, _) => y.time,
        measureFn: (SensorsData y, _) => y.y,
        data: WindSpeed1,
      ),
    ];
  }

  List<charts.Series<SensorsData, int>> _windSpeedData2() {
    List<SensorsData> WindSpeed2 = new List<SensorsData>();
    for (int i = 0; i < _windSpeedList.length; i++) {
      if (_windSpeedList[i].WindSpeed2 != null) {
        WindSpeed2.add(new SensorsData(_windSpeedList[i].x, _windSpeedList[i].y));
      }
    }

    final blue = charts.MaterialPalette.blue.makeShades(1);

    return [
      new charts.Series<SensorsData, int>(
        id: 'WindSpeed2',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData time, _) => blue[0],
        domainFn: (SensorsData y, _) => y.time,
        measureFn: (SensorsData y, _) => y.y,
        data: WindSpeed2,
      ),
    ];
  }

  List<charts.Series<SensorsData, int>> _windSpeedData3() {
    List<SensorsData> WindSpeed3 = new List<SensorsData>();
    for (int i = 0; i < _windSpeedList.length; i++) {
      if (_windSpeedList[i].WindSpeed3 != null) {
        WindSpeed3.add(new SensorsData(_windSpeedList[i].x, _windSpeedList[i].y));
      }
    }

    final blue = charts.MaterialPalette.blue.makeShades(1);

    return [
      new charts.Series<SensorsData, int>(
        id: 'WindSpeed3',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData time, _) => blue[0],
        domainFn: (SensorsData y, _) => y.time,
        measureFn: (SensorsData y, _) => y.y,
        data: WindSpeed3,
      ),
    ];
  }

  List<charts.Series<SensorsData, int>> _windSpeedData4() {
    List<SensorsData> WindSpeed4 = new List<SensorsData>();
    for (int i = 0; i < _windSpeedList.length; i++) {
      if (_windSpeedList[i].WindSpeed4 != null) {
        WindSpeed4.add(new SensorsData(_windSpeedList[i].x, _windSpeedList[i].y));
      }
    }

    final blue = charts.MaterialPalette.blue.makeShades(1);

    return [
      new charts.Series<SensorsData, int>(
        id: 'WindSpeed4',
        // Light shade for even years, dark shade for odd.
        colorFn: (SensorsData time, _) => blue[0],
        domainFn: (SensorsData y, _) => y.time,
        measureFn: (SensorsData y, _) => y.y,
        data: WindSpeed4,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return windSpeedList.length > 0
        ? new charts.LineChart(windSpeedList,
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
