// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pray_times.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayTimes _$PrayTimesFromJson(Map<String, dynamic> json) => PrayTimes(
      datetime: (json['datetime'] as List<dynamic>)
          .map((e) => DateTimes.fromJson(e as Map<String, dynamic>))
          .toList(),
      location:
          LocationsPrayTimes.fromJson(json['location'] as Map<String, dynamic>),
      settings:
          SettingsPrayTimes.fromJson(json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrayTimesToJson(PrayTimes instance) => <String, dynamic>{
      'datetime': instance.datetime,
      'location': instance.location,
      'settings': instance.settings,
    };
