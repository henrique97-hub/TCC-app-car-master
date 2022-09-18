class SensorJson {
  bool? sensor;

  SensorJson({this.sensor});

  SensorJson.fromJson(Map<String, dynamic> json) {
    sensor = json['sensor'];
  }

  Map<String, dynamic> toJson(String message) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sensor'] = this.sensor;
    return data;
  }
}