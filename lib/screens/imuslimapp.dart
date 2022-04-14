import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imuslim/screens/home/homescreen.dart';
import 'package:imuslim/screens/surah/surah_screen.dart';
import 'package:imuslim/state/bottomnavbloc/bottomnav_bloc.dart';
import 'package:imuslim/state/praybloc/pray_bloc.dart';
import 'package:imuslim/util/constants.dart';

class IMuslimApp extends StatelessWidget {
  const IMuslimApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;

    List<Widget> _widgetOption = <Widget>[
      HomeScreen(),
      SurahScreen(),
    ];

    return BlocBuilder<BottomnavBloc, BottomnavState>(
      builder: (context, state) {
        if (state is SuccessChangePage) {
          _currentIndex = state.page;

          if (state.page == 1) {
            BlocProvider.of<PrayBloc>(context).add(GetAllSurah());
          }
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              Constants.appName,
            ),
          ),
          body: _widgetOption.elementAt(_currentIndex),
          bottomNavigationBar: CurvedNavigationBar(
            index: _currentIndex,
            items: const <Widget>[
              Icon(Icons.access_time,
                  size: Constants.sizeBottomNav, semanticLabel: 'Waktu Shalat'),
              Icon(Icons.mosque,
                  size: Constants.sizeBottomNav, semanticLabel: 'Surat'),
            ],
            animationCurve: Curves.ease,
            animationDuration: const Duration(milliseconds: 500),
            buttonBackgroundColor: Constants.iwhite,
            height: 75,
            onTap: (index) {
              print('tapped index- $index');
              BlocProvider.of<BottomnavBloc>(context)
                  .add(ChangePage(page: index));
            },
          ),
        );
      },
    );
  }
}