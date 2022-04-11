import 'package:flutter/material.dart';
import 'package:imuslim/screens/imuslimapp.dart';
import 'package:imuslim/screens/splash/splashscreen.dart';

import '../screens/home/homescreen.dart';

class Routes {
  Map<String, WidgetBuilder> getRoutes = {
    '/': (_) => IMuslimApp(),
    '/homescreen': (_) => HomeScreen(),
    '/splashscreen': (_) => SplashScreen(),
  };
}
