import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
class FSPopSessionBox extends AlertDialog{

  FSPopSessionBox(String name,String message,Icon icon):
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
                    width: 15,
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: icon,
                  ),
                  trailing: IconButton(icon: Icon(Icons.toys),onPressed: (){},),
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
                    width: 80 ,
                    height: 70,
                    padding: EdgeInsets.all(8),
                    child: CircleAvatar(
                        backgroundImage: new AssetImage("assets/images/home/shidu.png")
                    ),
                  ),
                  Container(
                    color: Colors.amber,
                    width: 180 ,
                    child: ListTile(
                      title: Text("当前风速"),
                      subtitle: Text(
                        message,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
//                      trailing: Text(
//                        date,
//                        maxLines: 2,
//                        overflow: TextOverflow.ellipsis,
//                      ),
                    ),
                  ),
                ],
              ),
//              Text(message),
//              Text(message),
//              Text(message),
//              Text(message),

            ],
          ),
        ),

      );


}
