import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  late SharedPreferences pref;

  markLastSurah(String surah, String ayat) async {
    pref = await SharedPreferences.getInstance();
    pref.setString(surah, ayat);
  }

  getMarkLastSurah(String surah) async {
    pref = await SharedPreferences.getInstance();

    String? stringValue = pref.getString(surah);
    print(stringValue);
  }
}
