class WindSpeedEntity {
  String deviceId;
  String time;
  double y;
  String type;
  int x;
  String WindSpeed1;
  String WindSpeed2;
  String WindSpeed3;
  String WindSpeed4;

  WindSpeedEntity({
    String deviceId,
    String time,
    double y,
    String type,
    int x,
    String WindSpeed1,
    String WindSpeed2,
    String WindSpeed3,
    String WindSpeed4,
  });

  WindSpeedEntity.fromJson(List<dynamic> json) {
    time = json[0].toString();
    y = json[1];
    deviceId = json[2];
    type = json[3];

    int hour = int.parse(time.substring(11, 13));
    int min = int.parse(time.substring(14, 16));

    /*if (deviceId == "SDGW01DTU0201000801") {
      WindSpeed2 = deviceId;
      x = (hour * 6 + min / 10).toInt();
    }*/

    if (hour >= 16 && hour <= 23) {
      x = ((hour - 16) * 6 + min / 10).toInt();
    } else if (hour >= 00 && hour <= 15) {
      x = ((hour + 8) * 6 + min / 10).toInt();
    }

    if (deviceId == "FSGW01DTU0302000100") {
      WindSpeed1 = deviceId;
    }else if (deviceId == "FSGW01DTU0302000200") {
      WindSpeed2 = deviceId;
    }else if (deviceId == "FSGW01DTU0402010100") {
      WindSpeed3 = deviceId;
    }else if (deviceId == "FSGW01DTU0402010200") {
      WindSpeed4 = deviceId;
    }
  }
}