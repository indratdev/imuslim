import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imuslim/state/bottomnavbloc/bottomnav_bloc.dart';
import 'package:imuslim/state/locationbloc/location_bloc.dart';
import 'package:imuslim/state/praybloc/pray_bloc.dart';
import 'package:imuslim/state/timesbloc/times_bloc.dart';
import 'package:imuslim/util/constants.dart';
import 'package:imuslim/util/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TimesBloc()..add(GetcurrentDateLocal()),
        ),
        BlocProvider(
          create: (context) => LocationBloc()..add(GetLocationEvent()),
        ),
        BlocProvider(
          create: (context) => PrayBloc()..add(GetAllSurah()),
        ),
        BlocProvider(
          create: (context) => BottomnavBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Constants.iblueLight,
        ),
        initialRoute: '/splashscreen',
        routes: Routes().getRoutes,
      ),
    );
  }
}
