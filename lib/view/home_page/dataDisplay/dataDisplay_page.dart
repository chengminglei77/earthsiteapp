import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:earthsite/view/home_page/dataDisplay/windSpeed_page.dart';
import 'package:earthsite/view/home_page/dataDisplay/humidity_page.dart';

class DataDisplayPage extends StatefulWidget {
  @override
  _DataDisplayPageState createState() => _DataDisplayPageState();
}

class _DataDisplayPageState extends State<DataDisplayPage> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("数据总览",style: TextStyle(color: Colors.black),),
      ),
      body:Column(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.blueGrey ,
                child: FlatButton(
                  child: Text("风速传感器"),
                  textColor: Colors.blue,
                  onPressed: () {
                    //导航到新路由
                    Navigator.push( context,
                        MaterialPageRoute(builder: (context) {
                          return WindSpeedPage();
                        }));
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.blueGrey ,
                child: Text("风速传感器数据"),
              )
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.blueGrey ,
                child:  FlatButton(
                  child: Text("风速传感器"),
                  textColor: Colors.blue,
                  onPressed: () {
                    //导航到新路由
                    Navigator.push( context,
                        MaterialPageRoute(builder: (context) {
                          return HumidityPage();
                        }));
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.blueGrey ,
                child: Text("湿度传感器数据"),
              )
            ],
          )
        ],
      ) ,
    );
  }

}
