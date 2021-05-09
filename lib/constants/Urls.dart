abstract class Urls {
  static const String Base = 'http://192.168.1.1:9090/';
  //报警接口
  static const String Alarm_url = Base + 'admin/alarmInfoClassify/';

  //数据源
  static const String data_url = Base + 'influxDBQuery';

  //首页接口
  static const String Home_url = Base + 'settingId/';
}