class HumidityEntity {
  String deviceId;
  String time;
  double y;
  String type;
  int x;
  String Humidity0;
  String Humidity1;
  String Humidity2;

  HumidityEntity({
    String deviceId,
    String time,
    double y,
    String type,
    int x,
    String Humidity0,
    String Humidity1,
    String Humidity2,
  });

  HumidityEntity.fromJson(List<dynamic> json) {
    time = json[0].toString();
    y = json[1];
    deviceId = json[2];
    type = json[3];

    int hour = int.parse(time.substring(11, 13));
    int min = int.parse(time.substring(14, 16));

    /*if (deviceId == "SDGW01DTU0201000801") {
      Humidity0 = deviceId;
      x = (hour * 6 + min / 10).toInt();
    }*/

    if (hour >= 16 && hour <= 23) {
      x = ((hour - 16) * 6 + min / 10).toInt();
    } else if (hour >= 00 && hour <= 15) {
      x = ((hour + 8) * 6 + min / 10).toInt();
    }

    if (deviceId == "SDGW01DTU0201000800") {
      Humidity0 = deviceId;
    }else if (deviceId == "SDGW01DTU0201000801") {
      Humidity1 = deviceId;
    }else if (deviceId == "SDGW01DTU0201000802") {
      Humidity2 = deviceId;
    }
  }
}
