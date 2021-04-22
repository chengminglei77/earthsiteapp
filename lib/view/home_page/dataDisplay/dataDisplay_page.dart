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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.blue ,
                child: FlatButton(
                  color: Colors.blueAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.people,color: Colors.white,),
                      SizedBox(width: 10,),
                      Text("风速传感器",style: TextStyle(fontSize: 20,color: Colors.white),),
                    ],
                  ),
                  textColor: Colors.white,
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
                width: 500,
                child: Container(
                  width: 184,
                  height: 184,
                  color: Colors.grey,
                  child: Text("风速传感器数据",style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
              )
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.blue ,
                child:  FlatButton(
                  color: Colors.blueAccent,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.people,color: Colors.white,),
                      SizedBox(width: 10,),
                      Text("湿度传感器",style: TextStyle(fontSize: 20,color: Colors.white),),
                    ],
                  ),
                  textColor: Colors.white,
                  onPressed: () {
                    //导航到新路由
                    Navigator.push( context,
                        MaterialPageRoute(builder: (context) {
                          return HumidityPage(1);
                        }));
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.blueGrey ,
                width: 500,
                child: Container(
                  width: 184,
                  height: 184,
                  color: Colors.grey,
                  child: Text("湿度传感器数据",style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
              )
            ],
          )
        ],
      ) ,
    );
  }

}
