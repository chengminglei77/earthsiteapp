import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HumidityPage extends StatefulWidget {
  @override
  _HumidityPageState createState() => _HumidityPageState();
}

class _HumidityPageState extends State<HumidityPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("湿度传感器",style: TextStyle(color: Colors.black),),
      ),
    );
  }
}