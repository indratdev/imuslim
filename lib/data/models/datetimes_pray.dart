import 'package:json_annotation/json_annotation.dart';

part 'datetimes_pray.g.dart';
//part 'times.g.dart';
//part 'date.g.dart';

enum TimesPray {
  Imsak,
  Sunrise,
  Sunset,
  Asr,
  Dhuhr,
  Fajr,
  Isha,
  Maghrib,
  Midnight,
}

@JsonSerializable()
class DateTimes {
  Times times;
  Date date;

  DateTimes({required this.times, required this.date});

  factory DateTimes.fromJson(Map<String, dynamic> json) =>
      _$DateTimesFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DateTimesToJson(this);
}

@JsonSerializable()
class Times {
  String Imsak, Sunrise, Fajr, Dhuhr, Asr, Sunset, Maghrib, Isha, Midnight;

  Times({
    required this.Imsak,
    required this.Sunrise,
    required this.Sunset,
    required this.Asr,
    required this.Dhuhr,
    required this.Fajr,
    required this.Isha,
    required this.Maghrib,
    required this.Midnight,
  });

  factory Times.fromJson(Map<String, dynamic> json) => _$TimesFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TimesToJson(this);

  //getter

}

@JsonSerializable()
class Date {
  String gregorian, hijri;
  int timestamp;

  Date({
    required this.gregorian,
    required this.hijri,
    required this.timestamp,
  });

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DateToJson(this);
}
