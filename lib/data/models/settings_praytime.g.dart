// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_praytime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsPrayTimes _$SettingsPrayTimesFromJson(Map<String, dynamic> json) =>
    SettingsPrayTimes(
      fajr_angle: (json['fajr_angle'] as num).toDouble(),
      highlat: json['highlat'] as String,
      isha_angle: (json['isha_angle'] as num).toDouble(),
      juristic: json['juristic'] as String,
      school: json['school'] as String,
      timeformat: json['timeformat'] as String,
    );

Map<String, dynamic> _$SettingsPrayTimesToJson(SettingsPrayTimes instance) =>
    <String, dynamic>{
      'timeformat': instance.timeformat,
      'school': instance.school,
      'juristic': instance.juristic,
      'highlat': instance.highlat,
      'fajr_angle': instance.fajr_angle,
      'isha_angle': instance.isha_angle,
    };
