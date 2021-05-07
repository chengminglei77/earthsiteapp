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
                    width: 10,
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
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
          padding: EdgeInsets.fromLTRB(85, 0, 0, 0),
          child: new ListBody(
            children: [
              Text(message),
              Text(message),
              Text(message),
              Text(message),

            ],
          ),
        ),

      );


}
