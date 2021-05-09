class SensorEntity{
  String id;
  String sensorId;
  String sensorType;
  String sensorParam;
  String sensorValue;
  String colTime;

  SensorEntity(
      {
        String id,
        String sensorId,
        String sensorType,
        String sensorParam,
        String sensorValue,
        String colTime,
});

  SensorEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sensorId = json['sensorId'];
    sensorType = json['sensorType'];
    sensorParam = json['sensorParam'];
    sensorValue = json['sensorValue'];
    colTime = json['colTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sensorId'] = this.sensorId;
    data['sensorType'] = this.sensorType;
    data['sensorParam'] = this.sensorParam;
    data['sensorValue'] = this.sensorValue;
    data['colTime'] = this.colTime;
    return data;
  }
}