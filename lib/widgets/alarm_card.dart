import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('报警一', style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text('传感器数据丢失'),
            leading: Icon(
              Icons.add_alert,
              color: Colors.lightBlue,
            ),
          ),
          new Divider(),
        ],
      ),
    );
  }
}
