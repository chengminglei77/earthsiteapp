class ReturnBodyEntity {
  Object data;
  int Code;
  String Msg;

  ReturnBodyEntity({this.data, this.Code, this.Msg});

  ReturnBodyEntity.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    Code = int.parse(json['status']);
    Msg = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['code'] = this.Code;
    data['message'] = this.Msg;
    return data;
  }

}
