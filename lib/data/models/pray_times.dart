import 'package:imuslim/data/models/settings_praytime.dart';
import 'package:json_annotation/json_annotation.dart';
import 'datetimes_pray.dart';
import 'location_praytime.dart';

part 'pray_times.g.dart';

@JsonSerializable()
class PrayTimes {
  List<DateTimes> datetime;
  LocationsPrayTimes location;
  SettingsPrayTimes settings;

  PrayTimes(
      {required this.datetime, required this.location, required this.settings});

  factory PrayTimes.fromJson(Map<String, dynamic> json) =>
      _$PrayTimesFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PrayTimesToJson(this);
}
