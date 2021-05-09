import 'package:earthsite/widgets/chart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///风速传感器详细展示页面
class WindSpeedPage extends StatefulWidget {
  @override
  _WindSpeedPageState createState() => _WindSpeedPageState();
}

class _WindSpeedPageState extends State<WindSpeedPage>
    with SingleTickerProviderStateMixin{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("风速传感器",style: TextStyle(color: Colors.black)),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            ChartWidget(false,'风速传感器01','FSGW01DTU0302000100',false),
            ChartWidget(false,'风速传感器02','FSGW01DTU0302000200',false),
            ChartWidget(false,'风速传感器03','FSGW01DTU0402010100',false),
            ChartWidget(false,'风速传感器04','FSGW01DTU0402010200',false),
          ],
        ),
      ),
    );
  }
}