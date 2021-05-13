class SettingIdEntity{
  String sensorType;
  String sensorId;

  SettingIdEntity(
      {
        String sensorType,
        String sensorId,
      });

  SettingIdEntity.fromJson(Map<String, dynamic> json){
    sensorType = json['sensorType'];
    sensorId = json['sensorId'];
  }
}