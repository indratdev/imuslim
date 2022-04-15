import 'package:imuslim/data/models/pray_times.dart';
import 'package:imuslim/data/models/spesifik_surah_model.dart';
import 'package:imuslim/data/models/surah_model.dart';
import 'package:imuslim/data/others/location_device.dart';
import 'package:imuslim/data/others/times.dart';
import 'package:imuslim/data/providers/api_prayerprovider.dart';

class Repository {
  final prayerApiProvider = ApiPrayerProvider();
  final timeProvider = Times();
  final locationDevice = LocationDevice();

  // repo Prayer Time
  Future<PrayTimes> getDailyTimesPray(double lat, double lon) {
    return prayerApiProvider.getDailyTimesPray(lat, lon);
  }

  // =========== end repo Prayer Time ===========

  // repo Time Prayer
  MapEntry<String, dynamic> nextTimeShalat(Map<String, dynamic> times) {
    return timeProvider.nextTimeShalat(times);
  }

  Future<String> checkSelisihWaktu(String waktuAkanDatang) {
    return timeProvider.checkSelisihWaktu(waktuAkanDatang);
  }

  String currentDateLocal() {
    return timeProvider.currentDateLocal();
  }

  // =========== end repo Time Prayer ===========

  // repo location
  Future<Map<String, dynamic>> determinePosition() {
    return locationDevice.determinePosition();
  }
  // =========== end repo location ===========

  // =========== repo surah =============================
  Future<SurahModel> getSurah() {
    return prayerApiProvider.getSurah();
  }

  Future<SpesifikSurahModel> getDetailSurah(int number) {
    return prayerApiProvider.getDetailSurah(number);
  }
  // =========== end repo surah =========================
}
