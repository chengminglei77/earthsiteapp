import 'dart:convert';

import 'package:earthsite/bean/alarm_entity.dart';
import 'package:earthsite/constants/Urls.dart';
import 'package:earthsite/utils/HttpRequest.dart';
import 'package:earthsite/widgets/alarm_card.dart';
import 'package:earthsite/widgets/common_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  List<AlarmEntity> _alarmList = List();
  int currentPage = 1;
  int total = 0;

  @override
  void initState() {
    super.initState();
    _getAlarmList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("报警信息", style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          child: _alarmList.length > 0
              ? EasyRefresh(
                  child: ListView.builder(
                      itemBuilder: (c, i) =>
                          AlarmCard(alarmList: _alarmList[i]),
                      itemCount: _alarmList.length),
                  onRefresh: () async {
                    _alarmList.clear();
                    currentPage = 1;
                    _getAlarmList();
                  },
                  onLoad: () async {
                    if (_alarmList.length != total) {
                      currentPage++;
                      _getAlarmList();
                    }
                  },
                )
              : CommonLoading(),
        ));
  }

  void _getAlarmList() {
    print("-------getData-------");
    var params = {"pageNum": currentPage};
    HttpRequest.getInstance().get(Urls.Alarm_url + "listByTypeId", data: params,
        successCallBack: (data) {
      Map<String, dynamic> dataJson = json.decode(data);
      List responseJson = json.decode(json.encode(dataJson["rows"]));
      print("------responseData--------");
      List<AlarmEntity> cardbeanList =
          responseJson.map((m) => new AlarmEntity.fromJson(m)).toList();
      setState(() {
        _alarmList.addAll(cardbeanList);
      });
    }, errorCallBack: (code, msg) {});
  }

  @override
  void dispose() {
    super.dispose();
  }
}
