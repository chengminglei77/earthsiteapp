import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:earthsite/utils/net_utils.dart';


class HumidityListPage extends StatefulWidget {
  const HumidityListPage(this.type);

  final int type;

  @override
  _HumidityListPageState createState() => _HumidityListPageState(0);
}

class _HumidityListPageState extends State<HumidityListPage> with SingleTickerProviderStateMixin{
  int type;

  _HumidityListPageState(this.type);

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);


  @override
  Widget build(BuildContext context) {
    return Container(child: Text("湿度传感器1"));
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}


