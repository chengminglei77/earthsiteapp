import 'package:earthsite/view/home_page/alarm/alarm_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmCard extends StatelessWidget {
  DateTime time = new DateTime(2021, 4, 26);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('DTU电量30%预警', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19)),
            subtitle: Text('GW01DTU02电量为：20',),
            leading: Icon(
              Icons.add_alert,
              color: Colors.red,
            ),
          ),
          Divider(),
          Row(
            children: [
              Text(time.toString(),style: new TextStyle(fontSize: 17),),
              Spacer(),
              Text('已读'),
            ],
          ),
        ],
      ),
    );
  }
}
