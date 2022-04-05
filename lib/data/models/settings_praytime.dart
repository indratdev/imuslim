import 'package:json_annotation/json_annotation.dart';

part 'settings_praytime.g.dart';

@JsonSerializable()
class SettingsPrayTimes {
  String timeformat, school, juristic, highlat;
  double fajr_angle, isha_angle;

  SettingsPrayTimes({
    required this.fajr_angle,
    required this.highlat,
    required this.isha_angle,
    required this.juristic,
    required this.school,
    required this.timeformat,
  });

  factory SettingsPrayTimes.fromJson(Map<String, dynamic> json) =>
      _$SettingsPrayTimesFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SettingsPrayTimesToJson(this);
}
