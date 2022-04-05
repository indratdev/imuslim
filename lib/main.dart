import 'package:flutter/material.dart';
import 'package:imuslim/screens/splash/splashscreen.dart';
import 'package:imuslim/util/icolors.dart';
import 'package:imuslim/util/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: IColors.iblueLight,
      ),
      initialRoute: '/splashscreen',
      routes: Routes().getRoutes,
    );
  }
}
