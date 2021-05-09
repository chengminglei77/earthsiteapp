import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'PopSessionBox.dart';
import 'FSPopSessionBox.dart';
import 'dart:ui';
import 'package:earthsite/constants/Urls.dart';
import 'package:earthsite/utils/HttpRequest.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
class ScatterGram extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScatterGram();
}


class _ScatterGram extends State {
  @override
  void initState() {
    super.initState();
    _getSensorList();
  }
  int touchedIndex;

//  Color greyColor = Color(0xFFFF9A9A);
  Color greyColor = Colors.blueGrey;

  List<int> selectedSpots = [];

  @override
  Widget build(BuildContext context) {
    var stack=new Stack(
//      alignment: const FractionalOffset(0.5,0.5),
      children: <Widget>[
        new Container(
          width:500,
          height: 344,
          decoration: BoxDecoration(
//            color: Colors.amber,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image:new AssetImage("assets/images/home/wall4.png"),
            ),
          ),
        ),
        new Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                alignment: Alignment.centerRight,
                child: Column(
                  children: [
                    Container(
                      child: FancyButton6(onPressed: () async{

                        showDialog(
                          context: context,
                          builder: (ctx)=>FSPopSessionBox('风速传感器1',get[2]+' '+get[0]+'\n'+get[1],Icon(Icons.toys,color: Colors.amber,)),
//                             builder: (ctx)=>PopSessionBox(),
                        );
                      }),alignment: Alignment.bottomRight,
                    ),
                    SizedBox(width: 8,),
                    Container(
                      child: FancyButton7(onPressed: (){
                        showDialog(
                          context: context,
                          builder: (ctx)=>FSPopSessionBox('风速传感器2',get[5]+' '+get[3]+'\n'+get[4],Icon(Icons.toys,color: Colors.amber,)),
//                             builder: (ctx)=>PopSessionBox(),
                        );
                      }),alignment: Alignment.bottomRight,padding: EdgeInsets.fromLTRB(10,0,20,0),
                    ),
                    SizedBox(width: 8,),
                    Container(
                      child: FancyButton8(onPressed: (){
                        showDialog(
                          context: context,
                          builder: (ctx)=>FSPopSessionBox('风速传感器3',get[8]+' '+get[6]+'\n'+get[7],Icon(Icons.toys,color: Colors.amber,)),
//                             builder: (ctx)=>PopSessionBox(),
                        );
                      }),alignment: Alignment.bottomRight,padding: EdgeInsets.fromLTRB(10,0,15,0),
                    ),
                    Container(
                      child: FancyButton9(onPressed: (){
                        showDialog(
                          context: context,
                          builder: (ctx)=>FSPopSessionBox('风速传感器4',get[11]+' '+get[9]+'\n'+get[10],Icon(Icons.toys,color: Colors.amber,)),
//                             builder: (ctx)=>PopSessionBox(),
                        );
                      }),alignment: Alignment.bottomRight,
                    ),
                  ],

                ),
              ),



              Container(
//               height: 200,
               width: 550,
               child:  Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Row(
                     children: [
                       Container(
                         padding: EdgeInsets.fromLTRB(20, 20, 20, 1),
                         alignment: Alignment.centerLeft,
                         child: FancyButton1(onPressed: (){
                           _getSensorList();
                           showDialog(
                             context: context,
                             builder: (ctx)=>PopSessionBox('湿度传感器1',[get[18],get[15]],[get[12]],Icon(Icons.explore,color: Colors.amber,)),
//                             builder: (ctx)=>PopSessionBox(),
                           );
                         }),
                       ),

                       Container(
                         padding: EdgeInsets.fromLTRB(0, 0, 20, 50),
                         child: FancyButton2(onPressed: (){
                           showDialog(
                             context: context,
                             builder: (ctx)=>PopSessionBox('湿度传感器2',[get[27],get[24]],[get[21]],Icon(Icons.explore,color: Colors.amber,)),
//                             builder: (ctx)=>PopSessionBox(),
                           );
                         }),
                       ),

                       Container(
                           padding: EdgeInsets.fromLTRB(0, 0, 20, 80),
                           child: FancyButton3(onPressed: (){

                         showDialog(
                           context: context,
                           builder: (ctx)=>PopSessionBox('湿度传感器3',[get[36],get[33]],[get[30]],Icon(Icons.explore,color: Colors.amber,)),
//                             builder: (ctx)=>PopSessionBox(),
                         );
                       })),
                       Container(
                           padding: EdgeInsets.fromLTRB(0, 0, 20, 80),
                           child: FancyButton4(onPressed: (){
                         showDialog(
                           context: context,
                           builder: (ctx)=>PopSessionBox('湿度传感器4',[get[45],get[42]],[get[39]],Icon(Icons.explore,color: Colors.amber,)),
//                             builder: (ctx)=>PopSessionBox(),
                         );
                       })),
                       Container(
                           padding: EdgeInsets.fromLTRB(0, 0, 20, 80),
                           child: FancyButton4(onPressed: (){
                             showDialog(
                               context: context,
                               builder: (ctx)=>PopSessionBox('湿度传感器5',[get[54],get[51]],[get[48]],Icon(Icons.explore,color: Colors.amber,)),
//                             builder: (ctx)=>PopSessionBox(),
                             );
                           })),
                     ],
                   )

                 ],

               ),
             ),
            ],
          ),
//          child:Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: [
//
//              Column(
//                children: [
//                  new Positioned(
//                    top: 100.0,
//                    left: 200.0,
//
//                    child: FloatingActionButton(
//
////                      child: Text("风速",style: TextStyle(
////                          fontSize: 10.0
////                      ),),
////                      backgroundColor: Colors.redAccent[300],
////                      onPressed: (){},
//                    ),
//                  )
//
//                ],
//              ),
//
//            ],
//          )
//          child: RaisedButton.icon(
//            onPressed: (){},
//            icon: Icon(Icons.alternate_email),
//            color: Colors.amber,
//
//          ),

        )
        //点状图

//        new Container(
//          width: 540,
//          height: 224,
//          child: Container(
//            child: Card(
//              color: Colors.transparent,
//              child: ScatterChart(
//                ScatterChartData(
//                  scatterSpots: [
//                    ScatterSpot(
//                        4,
//                        5,
//                        color: selectedSpots.contains(0) ? Colors.green : greyColor,
//                        sensorInfo: '湿度'
//                    ),
//                    ScatterSpot(
//                      2,
//                      5,
//                      color: selectedSpots.contains(1) ? Colors.yellow : greyColor,
//                      radius: 10,
//                    ),
//                    ScatterSpot(
//                      8,
//                      4,
//                      color: selectedSpots.contains(2) ? Colors.purpleAccent : greyColor,
//                      radius: 8,
//                    ),
//                    ScatterSpot(
//                      8,
//                      6,
//                      color: selectedSpots.contains(3) ? Colors.orange : greyColor,
//                      radius: 15,
//                    ),
//                    ScatterSpot(
//                      5,
//                      4,
//                      color: selectedSpots.contains(4) ? Colors.brown : greyColor,
//                      radius: 14,
//                    ),
//                    ScatterSpot(
//                      6,
//                      3,
//                      color: selectedSpots.contains(5) ? Colors.lightGreenAccent : greyColor,
//                      radius: 13,
//                    ),
//                    ScatterSpot(
//                      3,
//                      4,
//                      color: selectedSpots.contains(6) ? Colors.red : greyColor,
//                      radius: 13,
//                    ),
//                    ScatterSpot(
//                      9,
//                      4,
//                      color: selectedSpots.contains(7) ? Colors.tealAccent : greyColor,
//                      radius: 8,
//                    ),
//                  ],
//                  minX: 0,
//                  maxX: 10,
//                  minY: 0,
//                  maxY: 10,
//                  borderData: FlBorderData(
//                    show: false,
//                  ),
//                  gridData: FlGridData(
//                    show: true,
//                    drawHorizontalLine: true,
//                    checkToShowHorizontalLine: (value) => true,
//                    getDrawingHorizontalLine: (value) => FlLine(color: Colors.pink.withOpacity(0.0)),
//                    drawVerticalLine: true,
//                    checkToShowVerticalLine: (value) => true,
//                    getDrawingVerticalLine: (value) => FlLine(color: Colors.pink.withOpacity(0.0)),
//                  ),
//                  titlesData: FlTitlesData(
//                    show: false,
//                  ),
//                  showingTooltipIndicators: selectedSpots,
//                  scatterTouchData: ScatterTouchData(
//                    enabled: true,
//                    handleBuiltInTouches: false,
//                    touchTooltipData: ScatterTouchTooltipData(
//                      tooltipBgColor: Colors.black,
//                      getTooltipItems: (ScatterSpot touchedBarSpot) {
//                        return ScatterTooltipItem(
//                          'X: ',
//                          TextStyle(
//                            height: 1.2,
//                            color: Colors.grey[100],
//                            fontStyle: FontStyle.italic,
//                          ),
//                          10,
//                          children: [
//                            TextSpan(
//                              text: '${touchedBarSpot.sensorInfo.toString()} \n',
//                              style: TextStyle(
//                                color: Colors.white,
//                                fontStyle: FontStyle.normal,
//                                fontWeight: FontWeight.bold,
//                              ),
//                            ),
//                            TextSpan(
//                              text: 'Y: ',
//                              style: TextStyle(
//                                height: 1.2,
//                                color: Colors.grey[100],
//                                fontStyle: FontStyle.italic,
//                              ),
//                            ),
//                            TextSpan(
//                              text: touchedBarSpot.y.toInt().toString(),
//                              style: TextStyle(
//                                color: Colors.white,
//                                fontStyle: FontStyle.normal,
//                                fontWeight: FontWeight.bold,
//                              ),
//                            ),
//                          ],
//                        );
//                      },
//                    ),
//                    touchCallback: (ScatterTouchResponse touchResponse) {
//                      if (touchResponse.clickHappened && touchResponse.touchedSpot != null) {
//                        final sectionIndex = touchResponse.touchedSpot.spotIndex;
//                        // Tap happened
//                        setState(() {
//                          if (selectedSpots.contains(sectionIndex)) {
//                            selectedSpots.remove(sectionIndex);
//                          } else {
//                            selectedSpots.add(sectionIndex);
//                          }
//                        });
//                      }
//                    },
//                  ),
//                ),
//              ),
//            ),
//          ),
//        )
      ],
    );
    return Container(
      child: stack,
    );
  }
}


class FancyButton1 extends StatelessWidget {
  final GestureTapCallback onPressed;
  FancyButton1({@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(minWidth: 40,minHeight: 40),
      fillColor: Colors.grey,
      splashColor: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 3.0),
        child: Row(

          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
              Icon(
                Icons.explore,
                color: Colors.amber,

              ),
            SizedBox(
              width: 1.0,
            ),
//            PulseAnimator(
//              //动画效果
//              child: Text(
//                '风速',
//                style: TextStyle(color: Colors.white),
//              ),
//            ),
          ],
        ),
      ),
      onPressed: onPressed, //点击事件
      shape: const StadiumBorder(), //添加圆角
    );
  }
}
class FancyButton2 extends StatelessWidget {
  final GestureTapCallback onPressed;
  FancyButton2({@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(minWidth: 40,minHeight: 40),
      fillColor: Colors.grey,
      splashColor: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
        child: Row(

          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.explore,
              color: Colors.amber,

            ),
            SizedBox(
              width: 1.0,
            ),
//            PulseAnimator(
//              //动画效果
//              child: Text(
//                '风速',
//                style: TextStyle(color: Colors.white),
//              ),
//            ),
          ],
        ),
      ),
      onPressed: onPressed, //点击事件
      shape: const StadiumBorder(), //添加圆角
    );
  }
}
class FancyButton3 extends StatelessWidget {
  final GestureTapCallback onPressed;
  FancyButton3({@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(minWidth: 40,minHeight: 40),
      fillColor: Colors.grey,
      splashColor: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
               Icon(
                Icons.explore,
                color: Colors.amber,
              ),
            SizedBox(
              width: 1.0,
            ),

          ],
        ),
      ),
      onPressed: onPressed, //点击事件
      shape: const StadiumBorder(), //添加圆角
    );
  }
}
class FancyButton4 extends StatelessWidget {
  final GestureTapCallback onPressed;
  FancyButton4({@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(minWidth: 40,minHeight: 40),
      fillColor: Colors.grey,
      splashColor: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
             Icon(
                Icons.explore,
                color: Colors.amber,
              ),

            SizedBox(
              width: 1.0,
            ),
          ],
        ),
      ),
      onPressed: onPressed, //点击事件
      shape: const StadiumBorder(), //添加圆角
    );
  }
}
class FancyButton5 extends StatelessWidget {
  final GestureTapCallback onPressed;
  FancyButton5({@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(minWidth: 40,minHeight: 40),
      fillColor: Colors.grey,
      splashColor: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.explore,
              color: Colors.amber,
            ),

            SizedBox(
              width: 1.0,
            ),
          ],
        ),
      ),
      onPressed: onPressed, //点击事件
      shape: const StadiumBorder(), //添加圆角
    );
  }
}
class FancyButton6 extends StatelessWidget {
  final GestureTapCallback onPressed;
  FancyButton6({@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(minWidth: 40,minHeight: 40),
      fillColor: Colors.grey,
      splashColor: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.toys,
              color: Colors.amber,
            ),

            SizedBox(
              width: 1.0,
            ),
          ],
        ),
      ),
      onPressed: onPressed, //点击事件
      shape: const StadiumBorder(), //添加圆角
    );
  }
}
class FancyButton7 extends StatelessWidget {
  final GestureTapCallback onPressed;
  FancyButton7({@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(minWidth: 40,minHeight: 40),
      fillColor: Colors.grey,
      splashColor: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.toys,
              color: Colors.amber,
            ),

            SizedBox(
              width: 1.0,
            ),
          ],
        ),
      ),
      onPressed: onPressed, //点击事件
      shape: const StadiumBorder(), //添加圆角
    );
  }
}
class FancyButton8 extends StatelessWidget {
  final GestureTapCallback onPressed;
  FancyButton8({@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(minWidth: 40,minHeight: 40),
      fillColor: Colors.grey,
      splashColor: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.toys,
              color: Colors.amber,
            ),

            SizedBox(
              width: 1.0,
            ),
          ],
        ),
      ),
      onPressed: onPressed, //点击事件
      shape: const StadiumBorder(), //添加圆角
    );
  }
}
class FancyButton9 extends StatelessWidget {
  final GestureTapCallback onPressed;
  FancyButton9({@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(minWidth: 40,minHeight: 40),
      fillColor: Colors.grey,
      splashColor: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.toys,
              color: Colors.amber,
            ),

            SizedBox(
              width: 1.0,
            ),
          ],
        ),
      ),
      onPressed: onPressed, //点击事件
      shape: const StadiumBorder(), //添加圆角
    );
  }
}
class PulseAnimator extends StatefulWidget {
  final Widget child;
  const PulseAnimator({Key key, this.child}) : super(key: key);
  @override
  _PulseAnimatorState createState() => _PulseAnimatorState();
}

class _PulseAnimatorState extends State<PulseAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200))
      ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween(begin: 0.5, end: 1.0).animate(_controller),
      child: widget.child,
    );
  }
}
Map get={};
void _getSensorList() {
  print("-------getData-------");
  HttpRequest.getInstance().get(Urls.Home_url + "getSensorInfo", data: null,
      successCallBack: (data) {
        print("----data----");
        print(data);

        List responseJson = json.decode(data);
        print("------responseData--------");
//        print(responseJson.first['id']);
//        print(responseJson.first['sensorValue']);
//        print(responseJson[0]['id']);
        //风速
        get[0]=responseJson[0]['sensorValue'];
        get[1]=responseJson[0]['colTime'];
        get[2]=responseJson[0]['sensorParam'];
        get[3]=responseJson[1]['sensorValue'];
        get[4]=responseJson[1]['colTime'];
        get[5]=responseJson[1]['sensorParam'];
        get[6]=responseJson[2]['sensorValue'];
        get[7]=responseJson[2]['colTime'];
        get[8]=responseJson[2]['sensorParam'];
        get[9]=responseJson[3]['sensorValue'];
        get[10]=responseJson[3]['colTime'];
        get[11]=responseJson[3]['sensorParam'];

        //湿度
        get[12]=responseJson[4]['sensorValue'];
        get[13]=responseJson[4]['colTime'];
        get[14]=responseJson[4]['sensorParam'];
        get[15]=responseJson[5]['sensorValue'];
        get[16]=responseJson[5]['colTime'];
        get[17]=responseJson[5]['sensorParam'];
        get[18]=responseJson[6]['sensorValue'];
        get[19]=responseJson[6]['colTime'];
        get[20]=responseJson[6]['sensorParam'];
        get[21]=responseJson[7]['sensorValue'];
        get[22]=responseJson[7]['colTime'];
        get[23]=responseJson[7]['sensorParam'];
        get[24]=responseJson[8]['sensorValue'];
        get[25]=responseJson[8]['colTime'];
        get[26]=responseJson[8]['sensorParam'];
        get[27]=responseJson[9]['sensorValue'];
        get[28]=responseJson[9]['colTime'];
        get[29]=responseJson[9]['sensorParam'];
        get[30]=responseJson[10]['sensorValue'];
        get[31]=responseJson[10]['colTime'];
        get[32]=responseJson[10]['sensorParam'];
        get[33]=responseJson[11]['sensorValue'];
        get[34]=responseJson[11]['colTime'];
        get[35]=responseJson[11]['sensorParam'];
        get[36]=responseJson[12]['sensorValue'];
        get[37]=responseJson[12]['colTime'];
        get[38]=responseJson[12]['sensorParam'];
        get[39]=responseJson[13]['sensorValue'];
        get[40]=responseJson[13]['colTime'];
        get[41]=responseJson[13]['sensorParam'];
        get[42]=responseJson[14]['sensorValue'];
        get[43]=responseJson[14]['colTime'];
        get[44]=responseJson[14]['sensorParam'];
        get[45]=responseJson[15]['sensorValue'];
        get[46]=responseJson[15]['colTime'];
        get[47]=responseJson[15]['sensorParam'];
        get[48]=responseJson[16]['sensorValue'];
        get[49]=responseJson[16]['colTime'];
        get[50]=responseJson[16]['sensorParam'];
        get[51]=responseJson[17]['sensorValue'];
        get[52]=responseJson[17]['colTime'];
        get[53]=responseJson[17]['sensorParam'];
        get[54]=responseJson[18]['sensorValue'];
//
//        int i;
//        for( i=0;i<responseJson.length;i++){
//          get[i]=responseJson[i]['id'];
//          get[i+1]=responseJson[i]['sensorValue'];
//          get[i+2]=responseJson[i]['colTime'];
//        }

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
        return get;
//        print(get[4]);
//
//        setState(() {
//          _sensorList.addAll(cardbeanList);
//        });
      });


}