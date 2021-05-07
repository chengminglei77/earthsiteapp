class AlarmEntity{
  String id;
  String deviceId;
  String alarmInfo;
  int status;
  String alarmTime;
  String alarmReason;
  String sensorId;
  String dtuId;

  AlarmEntity(
      {
        String id,
        String deviceId,
        String alarmInfo,
        int status,
        String alarmTime,
        String alarmReason,
        String sensorId,
        String dtuId,
});

  AlarmEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deviceId = json['deviceId'];
    alarmInfo = json['alarmInfo'];
    status = json['status'];
    alarmTime = json['alarmTime'];
    alarmReason = json['alarmReason'];
    sensorId = json['sensorId'];
    dtuId = json['dtuId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['deviceId'] = this.deviceId;
    data['alarmInfo'] = this.alarmInfo;
    data['status'] = this.status;
    data['alarmTime'] = this.alarmTime;
    data['alarmReason'] = this.alarmReason;
    data['sensorId'] = this.sensorId;
    data['dtuId'] = this.dtuId;
    return data;
  }
}