import 'package:flutter/material.dart';
import 'package:imuslim/screens/imuslimapp.dart';
import 'package:imuslim/screens/others_menu/othersmenu.dart';
import 'package:imuslim/screens/splash/splashscreen.dart';
import 'package:imuslim/screens/surah/surah_screen.dart';
import 'package:imuslim/screens/surah/surahdetail_screen.dart';

import '../screens/home/homescreen.dart';

class Routes {
  Map<String, WidgetBuilder> getRoutes = {
    '/': (_) => IMuslimApp(),
    '/homescreen': (_) => HomeScreen(),
    '/splashscreen': (_) => SplashScreen(),
    '/surah': (_) => SurahScreen(),
    '/surahdetail': (_) => SurahDetailScreen(),
    '/othersmenu': (_) => OthersMenu(),
  };
}
