import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:imuslim/data/models/pray_times.dart';
import 'package:imuslim/data/others/times.dart';

class ApiConnection {
  final currentTime = Times().currentTime();
  Future<PrayTimes> getDailyTimesPray(double lat, double lon) async {
    Uri url = Uri.parse(
        // 'https://api.pray.zone/v2/times/day.json?city=$city&date=2022-02-28');
        'https://api.pray.zone/v2/times/day.json?date=$currentTime&longitude=$lon&latitude=$lat');
    // 'https://api.pray.zone/v2/times/day.json?date=2022-04-07&longitude=-73.935242&latitude=40.730610'); // new york times
    // 'https://api.pray.zone/v2/times/day.json?date=2022-04-07&longitude=-73.935242&latitude=40.730610'); // new york times
    print(url);
    var response = await http.get(url);
    var result = jsonDecode(response.body);

    if (result['code'] == 200 && result['status'] == "OK") {
      // print(result['results']);
      return PrayTimes.fromJson(result['results']);
    } else {
      throw Exception('failed');
    }
  }
}
