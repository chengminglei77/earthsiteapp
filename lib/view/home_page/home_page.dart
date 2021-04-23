import 'dart:convert';
import 'home/components/dash_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home/components/home_scattergram.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
        title: Text("首页",style: TextStyle(color: Colors.black),),
      ),
      body:new SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                getEastWidget(),
                SizedBox(height: 2),
                Container(
                  padding: EdgeInsets.all(14.9),
                  color: Colors.grey ,
                  width: double.infinity,
                  child: Container(
                    width: 184,
                    height: 184,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
//                        getOriginWidget(),
                        getContentWidget(),

//                        getDTUWidget(),
//                        getSensorWidget(),
//                        getNetWidget(),
//                        getDashedWidget(),
//                        getContentWish(),
                  ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                getWestWidget(),
                SizedBox(height: 2),
                Container(
                  padding: EdgeInsets.all(14.9),
                  color: Colors.grey ,
                  width: double.infinity,
                  child: Container(
                    width: 184,
                    height: 184,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
//                        getOriginWidget(),
                        getContentWidget(),

//                        getDTUWidget(),
//                        getSensorWidget(),
//                        getNetWidget(),
//                        getDashedWidget(),
//                        getContentWish(),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                getSouthWidget(),
                SizedBox(height: 2),
                Container(
                  padding: EdgeInsets.all(14.9),
                  color: Colors.grey ,
                  width: double.infinity,
                  child: Container(
                    width: 184,
                    height: 184,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
//                        getOriginWidget(),
                        getContentWidget(),

//                        getDTUWidget(),
//                        getSensorWidget(),
//                        getNetWidget(),
//                        getDashedWidget(),
//                        getContentWish(),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(height: 12),
                getNorthWidget(),
                SizedBox(height: 2),
                Container(
                  padding: EdgeInsets.all(14.9),
                  color: Colors.grey ,
                  width: double.infinity,
                  child: Container(
                    width: 184,
                    height: 184,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
//                        getOriginWidget(),
                        getContentWidget(),

//                        getDTUWidget(),
//                        getSensorWidget(),
//                        getNetWidget(),
//                        getDashedWidget(),
//                        getContentWish(),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ) ,
      )
    );
  }
  Widget getEastWidget(){
    return Container(
      margin: EdgeInsets.fromLTRB(3, 2, 4, 0),
      padding: EdgeInsets.symmetric(vertical: 3,horizontal: 14),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        "东墙",
        style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }
  Widget getWestWidget(){
    return Container(
      margin: EdgeInsets.fromLTRB(3, 2, 4, 0),
      padding: EdgeInsets.symmetric(vertical: 3,horizontal: 14),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        "西墙",
        style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }
  Widget getSouthWidget(){
    return Container(
      margin: EdgeInsets.fromLTRB(3, 2, 4, 0),
      padding: EdgeInsets.symmetric(vertical: 3,horizontal: 14),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        "南墙",
        style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 131, 95, 36)),

      ),
    );
  }
  Widget getNorthWidget(){
    return Container(
      margin: EdgeInsets.fromLTRB(3, 2, 4, 0),
      padding: EdgeInsets.symmetric(vertical: 3,horizontal: 14),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        "北墙",
        style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }


//  Widget getOriginWidget(){
//    return Container(
//      padding: EdgeInsets.all(12),
//      width: double.infinity,
//      decoration: BoxDecoration(
//        color: Color(0xffeeeeee),
//        borderRadius: BorderRadius.circular(5),
//      ),
//      child: Text(
//        "土遗址东墙信息",
//        style: TextStyle(fontSize: 18,color: Colors.black54),
//      ),
//    );
//  }

  Widget getContentWish() {
    return Container(
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20,),
          Image.asset("assets/images/home/wish.png", width: 30,),
          SizedBox(height: 5,),
          Text(
            "总览",
            style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 235, 170, 60)),
          )
        ],
      ),
    );
  }
  Widget getContentWidget(){
    return Container(
      width: 420,
//      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
//          SizedBox(height: 12),
          ScatterGram(),
//          getDTUWidget(),
//          SizedBox(height: 10),
//          getSensorWidget(),
//          SizedBox(height: 10),
//          getNetWidget(),

        ],
      ),
    );
  }
  Widget getDTUWidget() {
    return Stack(
      children: <Widget>[
        Icon(Icons.wb_iridescent, color: Colors.redAccent,),
        Text.rich(
          TextSpan(
              children: [
                TextSpan(
                    text: "        " + "DTU"+"   ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    )
                ),
                TextSpan(
                  text: "详情",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue
                  ),
                )
              ]
          ),
          maxLines: 2,
        ),
      ],
    );
  }
  Widget getSensorWidget() {
    return Stack(
      children: <Widget>[
        Icon(Icons.settings_input_antenna, color: Colors.redAccent,),
        Text.rich(
          TextSpan(
              children: [
                TextSpan(
                    text: "        " + "传感器"+"   ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    )
                ),
                TextSpan(
                  text: "详情",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                  ),
                )
              ]
          ),
          maxLines: 2,
        ),
      ],
    );
  }
  Widget getNetWidget() {
    return Stack(
      children: <Widget>[
        Icon(Icons.wifi_tethering, color: Colors.redAccent,),
        Text.rich(
          TextSpan(
              children: [
                TextSpan(
                    text: "        " + "网关"+"   ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    )
                ),
                TextSpan(
                  text: "详情",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue
                  ),
                )
              ]
          ),
          maxLines: 2,
        ),
      ],
    );
  }
//获取分割线的Widget
Widget getDashedWidget(){
    return Container(
      height: 110,
      width: 1,
      child: DashedLine(
        axis: Axis.vertical,
        dashedHeight: 5,
        count: 12,
        color: Color(0xffaaaaaa),
      ),
    );
}
}
