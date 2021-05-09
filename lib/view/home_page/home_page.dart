import 'dart:convert';
import 'package:earthsite/bean/sensor_entity.dart';

import 'home/components/dash_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home/components/home_scattergram.dart';
import 'package:earthsite/constants/Urls.dart';
import 'package:earthsite/utils/HttpRequest.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SensorEntity> _sensorList=List();


//  @override
//  void initState() {
//    super.initState();
//    _getSensorList();
//  }
  @override
  Widget build(BuildContext context){
    var stack=new Stack(
      alignment: const FractionalOffset(0.5,0.5),
      children: <Widget>[
//        new Container(
//          width:470,
//          height: 300,
//          decoration: BoxDecoration(
//            color: Colors.amber,
//            image: new DecorationImage(
//              fit: BoxFit.cover,
//              image:new AssetImage("assets/images/home/wall.png"),
//            ),
//          ),
//        ),
        new Container(

//          padding: EdgeInsets.all(5.0),
          child: getContentWidget(),
        )
      ],
    );
    return Scaffold(

      appBar: AppBar(
        title: Text("首页",style: TextStyle(color: Colors.black),),
        centerTitle: true, // 标题居中
      ),
      body:new SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                getEastWidget(),
                SizedBox(height: 2),
                Center(
                  child: stack,
                ),
                Container(
//                  padding: EdgeInsets.all(14.9),
//                  color: Colors.grey ,
                  width: double.infinity,
                  child: Container(
//                    width: 184,
//                    height: 184,
//                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
//                        getOriginWidget(),
//                        getContentWidget(),
//                          RaisedButton(
//                            child: Text("测试"),
//                            onPressed: () async{
////                              _getSensorList();
////                              var res=await HttpRequest.instance.get(Urls.Home_url+ "/getSensorInfo");
////
////                              String body=res.body;
////                              //解析json数据
////                              var json = jsonDecode(body);
////                              print(json);
////                              try {
////                                Response response = await Dio().get("http://192.168.0.103:9090/settingId");
////                                print(response);
////                              } catch (e) {
////                                print(e);
////                              }
//                            },
//                          )
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                getWestWidget(),
                SizedBox(height: 2),
                Center(
                  child: stack,
                ),
                Container(
//                  padding: EdgeInsets.all(14.9),
//                  color: Colors.grey ,
                  width: double.infinity,
                  child: Container(
//                    width: 184,
//                    height: 184,
//                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
//                        getOriginWidget(),
//                        getContentWidget(),
//                          FancyButton(onPressed: (){}),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                getSouthWidget(),
                SizedBox(height: 2),
                Center(
                  child: stack,
                ),
                Container(
//                  padding: EdgeInsets.all(14.9),
//                  color: Colors.grey ,
                  width: double.infinity,
                  child: Container(
//                    width: 184,
//                    height: 184,
//                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
//                        getOriginWidget(),
//                        getContentWidget(),
//                          FancyButton(onPressed: (){}),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                getNorthWidget(),
                SizedBox(height: 2),
                Center(
                  child: stack,
                ),
                Container(
//                  padding: EdgeInsets.all(14.9),
//                  color: Colors.grey ,
                  width: double.infinity,
                  child: Container(
//                    width: 184,
//                    height: 184,
//                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
//                        getOriginWidget(),
//                        getContentWidget(),
//                          FancyButton(onPressed: (){}),
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
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//
//              children: [
//                SizedBox(height: 12),
//                getNorthWidget(),
//                SizedBox(height: 2),
//                Container(
//                  padding: EdgeInsets.all(14.9),
//                  color: Colors.grey ,
//                  width: double.infinity,
//                  child: Container(
//                    width: 184,
//                    height: 184,
//                    color: Colors.white,
//                    child: Row(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
////                        getOriginWidget(),
//                        getContentWidget(),
//
////                        getDTUWidget(),
////                        getSensorWidget(),
////                        getNetWidget(),
////                        getDashedWidget(),
////                        getContentWish(),
//                      ],
//                    ),
//                  ),
//                )
//              ],
//            )
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
      width: 500,
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
//void _getSensorList() {
//  print("-------getData-------");
//  HttpRequest.getInstance().get(Urls.Home_url + "getSensorInfo", data: null,
//      successCallBack: (data) {
//        Map<String, dynamic> dataJson = json.decode(data);
//        List responseJson = json.decode(json.encode(dataJson["rows"]));
//        print("------responseData--------");
//        print(responseJson);
//        List<SensorEntity> cardbeanList =
//        responseJson.map((m) => new SensorEntity.fromJson(m)).toList();
//        setState(() {
//          _sensorList.addAll(cardbeanList);
//        });
//
//        print("22222222");
//        print(cardbeanList);
//        }, errorCallBack: (code, msg) {});
//
//}

//void _getSensorList() {
//  print("-------getData-------");
//  HttpRequest.getInstance().get(Urls.Home_url + "getSensorInfo", data: null,
//      successCallBack: (data) {
//        print("----data----");
//        print(data);
//
//        List responseJson = json.decode(data);
//        print("------responseData--------");
////        print(responseJson.first['id']);
////        print(responseJson.first['sensorValue']);
////        print(responseJson[0]['id']);
//
//        Map get={};
//        get[0]=responseJson[0]['id'];
//        get[1]=responseJson[0]['sensorValue'];
//        get[2]=responseJson[0]['colTime'];
//        get[3]=responseJson[0]['sensorParam'];
//        get[4]=responseJson[1]['id'];
//        get[5]=responseJson[1]['sensorValue'];
//        get[6]=responseJson[1]['colTime'];
//        get[7]=responseJson[1]['sensorParam'];
//        get[8]=responseJson[2]['id'];
//        get[9]=responseJson[2]['sensorValue'];
//        get[10]=responseJson[2]['colTime'];
//        get[11]=responseJson[2]['sensorParam'];
//        get[12]=responseJson[3]['id'];
//        get[13]=responseJson[3]['sensorValue'];
//        get[14]=responseJson[3]['colTime'];
//        get[15]=responseJson[3]['sensorParam'];
////
////        int i;
////        for( i=0;i<responseJson.length;i++){
////          get[i]=responseJson[i]['id'];
////          get[i+1]=responseJson[i]['sensorValue'];
////          get[i+2]=responseJson[i]['colTime'];
////        }
//
//        print(get[0]);
//        print(get[1]);
//        print(get[2]);
//        print(get[3]);
//        print(get[4]);
//        print(get[5]);
//        print(get[6]);
//        print(get[7]);
//        print(get[8]);
//        print(get[9]);
//        print(get[10]);
//        print(get[11]);
////        print(get[4]);
////
////        setState(() {
////          _sensorList.addAll(cardbeanList);
////        });
//      });
//
//}


//class GetSensorList extends StatefulWidget {
//  @override
//  _GetSensorListState createState() => _GetSensorListState();
//}
//
//class _GetSensorListState extends State<GetSensorList> {
//  @override
//  Widget build(BuildContext context) {
//    return FancyButton1(
//    );
//  }
//}

