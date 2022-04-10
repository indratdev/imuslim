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
    // print('current time : $current');
    return current;
  }

  MapEntry<String, dynamic> nextTimeShalat(Map<String, dynamic> times) {
    var now = currentTime();
    return checkTimeFirst(times, now);
  }

  MapEntry<String, dynamic> checkTimeFirst(
      Map<String, dynamic> listWaktu, String waktuSekarang) {
    Map<String, dynamic> result = {};

    int now = int.parse(waktuSekarang.replaceAll(':', ''));
    // int now = 2100;

    for (var item in listWaktu.entries) {
      var value = int.parse((item.value.toString()).replaceAll(':', ''));
      // print('now : $now, value : $value');
      if (now <= value) {
        result.addAll({item.key: item.value});
        break;
      } else {
        // result.addAll({'Imsak': 'Next Day'});
        result.addAll({'': ''});
      }
    }
    return result.entries.last;
  }

  // cek selisih waktu
  Future<String> checkSelisihWaktu(String waktuAkanDatang) async {
    late String result;
    var format = DateFormat("HH:mm");
    var time = format.parse(currentTime());
    var next = format.parse(waktuAkanDatang.toString());
    var hasil = next.difference(time);
    var hasil2 = hasil.toString().replaceAll(':00.000000', '');
    var jam = hasil2.substring(0, 1);
    var menit = hasil2.substring(2, 4);

    (jam == '0')
        ? result = '$menit menit lagi'
        : result = '$jam jam, $menit menit lagi';

    return result;
  }
}
