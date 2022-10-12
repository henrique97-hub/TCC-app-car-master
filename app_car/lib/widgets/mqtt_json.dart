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

class SensorPreJson {
  bool? sensor;

  SensorPreJson({this.sensor});

  SensorPreJson.fromJson(Map<String, dynamic> json) {
    sensor = json['sensorpre'];
  }

  Map<String, dynamic> toJson(String message) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sensorpre'] = this.sensor;
    return data;
  }
}

class SensorMovJson {
  bool? sensor;

  SensorMovJson({this.sensor});

  SensorMovJson.fromJson(Map<String, dynamic> json) {
    sensor = json['sensormov'];
  }

  Map<String, dynamic> toJson(String message) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sensormov'] = this.sensor;
    return data;
  }
}

class SensorAlJson {
  bool? sensor;

  SensorAlJson({this.sensor});

  SensorAlJson.fromJson(Map<String, dynamic> json) {
    sensor = json['sensoral'];
  }

  Map<String, dynamic> toJson(String message) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sensoral'] = this.sensor;
    return data;
  }
}
