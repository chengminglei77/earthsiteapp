import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
class PopSessionBox extends AlertDialog{

  PopSessionBox(String name,List<dynamic> message,List<dynamic> thirty,Icon icon):
      super(
        title: Container(

//            child:Row(
//              mainAxisAlignment:MainAxisAlignment.center,
//              children: [
//                icon,
//                new Text(name,),
//              ],
//            ),
//           color:Colors.grey,
//
//            alignment:Alignment.center
        child: Column(
          children: [
            Container(
              height: 50,
              color: Colors.lightBlue,
              child: ListTile(
                leading: Container(
                  width: 10,
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: icon,
                ),
                trailing: IconButton(icon: Icon(Icons.explore),onPressed: (){},),
                title: Center(
                  child: Text(name,),),
              ),
            )
          ],
        ),
        ),
//      titleTextStyle: TextStyle(color: Colors.black87, fontSize: 16),
      titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        content: new SingleChildScrollView(
//          padding: EdgeInsets.fromLTRB(85, 0, 0, 0),
          child: new ListBody(
            children: [
              Row(
                children: [
                  Container(
//                    color: Colors.lightBlue,
                    width: 70 ,
                    height: 70,
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                        backgroundImage: new AssetImage("assets/images/home/fengsu.jpg")
                    ),
                  ),
                  Container(
                    color: Colors.amber,
                    width: 150 ,
                    child: ListTile(
                      title: Text("(5cm)湿度值："),
                      subtitle: Text(
                        message[0],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
//                    color: Colors.lightBlue,
                    width: 70 ,
                    height: 70,
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                        backgroundImage: new AssetImage("assets/images/home/fengsu.jpg")
                    ),
                  ),
                  Container(
                    color: Colors.amber,
                    width: 150 ,
                    child: ListTile(
                      title: Text("(15cm)湿度值："),
                      subtitle: Text(
                        message[1],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
//                    color: Colors.lightBlue,
                    width: 70 ,
                    height: 70,
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                        backgroundImage: new AssetImage("assets/images/home/fengsu.jpg")
                    ),
                  ),
                  Container(
                    color: Colors.amber,
                    width: 150 ,
                    child: ListTile(
                      title: Text("(30cm)湿度值："),
                      subtitle: Text(
                        thirty[0],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),


//              Text(message),
//              Text(message),
//              Text(message),
//              Text(message),
//          new FlatButton(
//              onPressed: (){
//                Navigator.of(context).pop();
//              },
//              textColor:Colors.white,
//              color: Colors.lightBlue,
//              child: Container(child: Text("确  定",),
//                alignment: Alignment.center,)
//          ),
            ],
          ),
        ),
//        actions: [
//          new FlatButton(
//              onPressed: (){
//                Navigator.of(context).pop();
//              },
//              textColor:Colors.white,
//              color: Colors.lightBlue,
//              child: Container(child: Text("确  定",),
//                alignment: Alignment.center,)
//          ),
//        new FlatButton(
//            onPressed: (){
//              Navigator.of(context).pop();
//            },
//            color: Colors.lightBlue,
//            child: Text("取消")
//        ),
//        ],
      );

//  @override
//  Widget build(BuildContext context) {
//
//    // TODO: implement build
//    return new AlertDialog(
//       title: Container(
//
//           child:Row(
//             children: [
//               Icon(Icons.assistant_photo, color: Colors.redAccent,),
//               new Text('风速传感器',),
//             ],
//           ),
////           color:Colors.lightBlue,
//
//           alignment:Alignment.center
//       ),
////      titleTextStyle: TextStyle(color: Colors.black87, fontSize: 16),
////      titlePadding: EdgeInsets.fromLTRB(200, 10, 10, 10),
//      content: new SingleChildScrollView(
//        child: new ListBody(
//          children: [
//            Text("11111111"),
//            Text("11111111"),
//            Text("11111111"),
//            Text("11111111"),
//          ],
//        ),
//      ),
//      actions: [
//        new FlatButton(
//            onPressed: (){
//              Navigator.of(context).pop();
//            },
//            textColor:Colors.white,
//            color: Colors.lightBlue,
//            child: Container(child: Text("确  定",),
//            alignment: Alignment.center,)
//        ),
////        new FlatButton(
////            onPressed: (){
////              Navigator.of(context).pop();
////            },
////            color: Colors.lightBlue,
////            child: Text("取消")
////        ),
//      ],
//    );
//
//
//  }
}

class ReplyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double rpx=MediaQuery.of(context).size.width/750;

    return Container(
      child: Column(
        children: [
          Row(children: [
            Container(
              width: 100*rpx,
              child: CircleAvatar(),
            ),
            Container(
              width: 550*rpx,
            ),
            Container(
              width: 100*rpx,
            ),
          ],)
        ],
      ),
    );
  }
}
class AfterReply extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double rpx=MediaQuery.of(context).size.width/750;
    return Container(
      child: Column(
        children: [
          Row(children: [
            Container(
              width: 100*rpx,
            ),
            Container(
              width: 550*rpx,
            ),
            Container(
              width: 100*rpx,
            ),
          ],)
        ],
      ),
    );
  }
}


