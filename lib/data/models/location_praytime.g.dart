// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_praytime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationsPrayTimes _$LocationsPrayTimesFromJson(Map<String, dynamic> json) =>
    LocationsPrayTimes(
      city: json['city'] as String? ?? '',
      country: json['country'] as String,
      country_code: json['country_code'] as String,
      elevation: (json['elevation'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      local_offset: (json['local_offset'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      timezone: json['timezone'] as String,
    );

Map<String, dynamic> _$LocationsPrayTimesToJson(LocationsPrayTimes instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'elevation': instance.elevation,
      'local_offset': instance.local_offset,
      'city': instance.city,
      'country': instance.country,
      'country_code': instance.country_code,
      'timezone': instance.timezone,
    };
