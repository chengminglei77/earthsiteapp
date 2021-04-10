import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class WindSpeedPage extends StatefulWidget {
  @override
  _WindSpeedPageState createState() => _WindSpeedPageState();
}

class _WindSpeedPageState extends State<WindSpeedPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("风速传感器",style: TextStyle(color: Colors.black),),
      ),
    );
  }
}