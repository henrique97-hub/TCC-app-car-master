import 'package:json_annotation/json_annotation.dart';

part 'mqtt_json.g.dart';


@JsonSerializable()
class SensorJSON {
  SensorJSON({required this.sensor});

  String sensor;

  factory SensorJSON.fromJson(Map<String, dynamic> json) => _$SensorJSONFromJson(json);

  Map<String, dynamic>toJson()=> _$SensorJSONToJson(this);
}