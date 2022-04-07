import 'package:imuslim/data/models/datetimes_pray.dart';
import 'package:imuslim/data/models/pray_times.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Times {
  String _times = '';

  get getcurrentDateLocal => _times;

  set setCurrenTime(String value) {}

  String currentDateLocal() {
    initializeDateFormatting();
    DateFormat dateFormat = DateFormat.yMMMMd('id');
    // DateFormat timeFormat = new DateFormat.Hms('id'); // kalau mau ambil sama jamnya
    return dateFormat.format(DateTime.now());
  }

  String currentDate() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  String currentTime() {
    var current = DateFormat('HH:mm').format(DateTime.now());
    // print('current : $current');

    return current;
  }

  Map<String, dynamic> nextTimeShalat(Map<String, dynamic> times) {
    var now = currentTime();
    return checkTimeFirst(times, now);
  }

  Map<String, dynamic> checkTimeFirst(
      Map<String, dynamic> listWaktu, String waktuSekarang) {
    Map<String, dynamic> result = {};

    int now = int.parse(waktuSekarang.replaceAll(':', ''));

    for (var item in listWaktu.entries) {
      var value = int.parse((item.value.toString()).replaceAll(':', ''));
      if (now < value) {
        result.addAll({item.key: item.value});
        break;
      } else {
        result.addAll({'Imsak': 'Next Day'});
      }
    }
    return result;
  }
}
