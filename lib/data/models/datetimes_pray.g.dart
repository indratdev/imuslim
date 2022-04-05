// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datetimes_pray.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateTimes _$DateTimesFromJson(Map<String, dynamic> json) => DateTimes(
      times: Times.fromJson(json['times'] as Map<String, dynamic>),
      date: Date.fromJson(json['date'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DateTimesToJson(DateTimes instance) => <String, dynamic>{
      'times': instance.times,
      'date': instance.date,
    };

Times _$TimesFromJson(Map<String, dynamic> json) => Times(
      Imsak: json['Imsak'] as String,
      Sunrise: json['Sunrise'] as String,
      Sunset: json['Sunset'] as String,
      Asr: json['Asr'] as String,
      Dhuhr: json['Dhuhr'] as String,
      Fajr: json['Fajr'] as String,
      Isha: json['Isha'] as String,
      Maghrib: json['Maghrib'] as String,
      Midnight: json['Midnight'] as String,
    );

Map<String, dynamic> _$TimesToJson(Times instance) => <String, dynamic>{
      'Imsak': instance.Imsak,
      'Sunrise': instance.Sunrise,
      'Fajr': instance.Fajr,
      'Dhuhr': instance.Dhuhr,
      'Asr': instance.Asr,
      'Sunset': instance.Sunset,
      'Maghrib': instance.Maghrib,
      'Isha': instance.Isha,
      'Midnight': instance.Midnight,
    };

Date _$DateFromJson(Map<String, dynamic> json) => Date(
      gregorian: json['gregorian'] as String,
      hijri: json['hijri'] as String,
      timestamp: json['timestamp'] as int,
    );

Map<String, dynamic> _$DateToJson(Date instance) => <String, dynamic>{
      'gregorian': instance.gregorian,
      'hijri': instance.hijri,
      'timestamp': instance.timestamp,
    };
