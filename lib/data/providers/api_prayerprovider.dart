import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:imuslim/data/models/pray_times.dart';
import 'package:imuslim/data/models/surah_model.dart';
import 'package:imuslim/data/others/times.dart';

class ApiPrayerProvider {
  final currentTime = Times().currentTime();

  Future<PrayTimes> getDailyTimesPray(double lat, double lon) async {
    Uri url = Uri.parse(
        'https://api.pray.zone/v2/times/day.json?date=$currentTime&longitude=$lon&latitude=$lat');
    // 'https://api.pray.zone/v2/times/day.json?date=2022-04-07&longitude=-73.935242&latitude=40.730610'); // new york times
    var response = await http.get(url);
    var result = jsonDecode(response.body);

    if (result['code'] == 200 && result['status'] == "OK") {
      return PrayTimes.fromJson(result['results']);
    } else {
      throw Exception('failed');
    }
  }

  Future<SurahModel> getSurah() async {
    Uri url = Uri.parse('https://api.quran.sutanlab.id/surah');
    var response = await http.get(url);
    var result = jsonDecode(response.body);
    // print('data ===> ${result}');

    if (result['code'] == 200 && result['status'] == 'OK.') {
      return SurahModel.fromJson(result);
    } else {
      throw Exception('Failed Get Surah');
    }
  }
}
