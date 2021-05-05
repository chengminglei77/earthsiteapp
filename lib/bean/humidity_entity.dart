class AlarmEntity{
  String id;
  String deviceId;
  String time;
  String y;

  AlarmEntity(
      {
        String id,
        String deviceId,
        String time,
        String y,
      });

  AlarmEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deviceId = json['deviceId'];
    time = json['time'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['deviceId'] = this.deviceId;
    data['time'] = this.time;
    data['y'] = this.y;
    return data;
  }
}