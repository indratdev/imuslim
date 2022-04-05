import 'package:json_annotation/json_annotation.dart';

part 'location_praytime.g.dart';

@JsonSerializable()
class LocationsPrayTimes {
  double latitude, longitude;
  double elevation, local_offset;
  String city, country, country_code, timezone;

  LocationsPrayTimes({
    this.city = '',
    required this.country,
    required this.country_code,
    required this.elevation,
    required this.latitude,
    required this.local_offset,
    required this.longitude,
    required this.timezone,
  });

  factory LocationsPrayTimes.fromJson(Map<String, dynamic> json) =>
      _$LocationsPrayTimesFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LocationsPrayTimesToJson(this);
}
