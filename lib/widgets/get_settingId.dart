import 'dart:convert';

import 'package:earthsite/bean/settingId_entity.dart';
import 'package:earthsite/constants/Urls.dart';
import 'package:earthsite/utils/HttpRequest.dart';
import 'package:flutter/material.dart';

class GetSettingId extends StatefulWidget {
  @override
  _GetSettingIdState createState() => _GetSettingIdState();
}

class _GetSettingIdState extends State<GetSettingId> {
  List<SettingIdEntity> _sensorList = List();
  List<SettingIdEntity> _settingIdList = List();

  @override
  void initState() {
    super.initState();
    _getSettingIdList();
  }

  void _getSettingIdList() {
    print("-------getData-------");
    HttpRequest.getInstance().get(Urls.Home_url + "getSettingId",
        successCallBack: (data) {
      List responseJson = json.decode(data);
      print("------responseData--------");
      print(responseJson);
      List<SettingIdEntity> sensorList =
          responseJson.map((m) => new SettingIdEntity.fromJson(m)).toList();
      List<SettingIdEntity> settingIdList =
          responseJson.map((m) => new SettingIdEntity.fromJson(m)).toList();
      setState(() {
        _sensorList.addAll(sensorList);
        _settingIdList.addAll(settingIdList);
      });
    }, errorCallBack: (code, msg) {});
  }

  @override
  Widget build(BuildContext context) {

  }
}
