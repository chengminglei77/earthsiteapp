import 'dart:convert';

import 'package:earthsite/view/account/login_page.dart';
import 'package:earthsite/widgets/alarm_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("报警信息",style: TextStyle(color: Colors.black)),
      ),
      body:Column(
        children: [
          AlarmCard(),
          AlarmCard(),
        ],
      ) ,
    );
  }
}
