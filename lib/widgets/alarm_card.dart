import 'package:earthsite/bean/alarm_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmCard extends StatelessWidget {
  const AlarmCard({
    Key key,
    @required AlarmEntity alarmList,
  })  : _alarmList = alarmList,
        super(key: key);

  final AlarmEntity _alarmList;

  @override
  Widget build(BuildContext context) {
    return _alarmList.alarmInfo == null && _alarmList.alarmReason == null
        ? Card(
            child: Text('数据出错啦'),
          )
        : Card(
            child: InkWell(
                child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(_alarmList.alarmInfo,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 19)),
                  subtitle: Text(_alarmList.alarmReason),
                  leading: Icon(
                    Icons.add_alert,
                    color: Colors.red,
                  ),
                ),
                Divider(),
                Row(
                  children: [
                    Text(
                      _alarmList.alarmTime,
                      style: new TextStyle(fontSize: 17),
                    ),
                    Spacer(),
                    Text(_alarmList.status.toString()),
                  ],
                ),
              ],
            )),
          );
  }
}
