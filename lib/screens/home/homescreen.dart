import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imuslim/state/locationbloc/location_bloc.dart';
import 'package:imuslim/state/praybloc/pray_bloc.dart';
import 'package:imuslim/state/timesbloc/times_bloc.dart';
import 'package:imuslim/util/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> locationDevice = Map<String, dynamic>();
    int _page = 0;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.iwhite,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.shade100,
                      blurRadius: 1.0,
                      offset: Offset(0, 1),
                      spreadRadius: 4.0,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    BlocBuilder<LocationBloc, LocationState>(
                      builder: (context, state) {
                        if (state is SuccessGetLocation) {
                          // kalau sukses dapat lokasi, jalanin ambil waktu shalat
                          locationDevice = state.result;
                          Position pos = locationDevice['position'];
                          context.read<PrayBloc>().add(GetDefaultPrayTime(
                              lat: pos.latitude, lon: pos.longitude));

                          // end
                          return SizedBox(
                            width: 100,
                            child: Text(
                              '${state.result['cityName']}',
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        } else if (state is LoadingGetLocation) {
                          return const CircularProgressIndicator.adaptive();
                        } else if (state is FailedGetLocation) {
                          return Text(
                            state.info.toString(),
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        } else {
                          return const Text('Undefined');
                        }
                      },
                    ),
                    BlocBuilder<TimesBloc, TimesState>(
                      builder: (context, state) {
                        if (state is SuccessTimes) {
                          return Text(
                            state.value.toString(),
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        } else if (state is LoadingTimes) {
                          return const CircularProgressIndicator.adaptive();
                        } else if (state is FailureTimes) {
                          return Text(
                            state.error.toString(),
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        } else {
                          return const Text('Undefined');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Column(
                  children: <Widget>[
                    Text(
                      'dhuhr 11: 57',
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '30 menit lagi',
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Constants.iwhite,
                ),
                child: BlocBuilder<PrayBloc, PrayState>(
                  builder: (context, state) {
                    if (state is LoadingDefaultPrayTime) {
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    } else if (state is FailureDefaultPrayTime) {
                      return Container(
                        child: Text('Error: ${state.info}'),
                      );
                    } else if (state is SuccessDefaultPrayTime) {
                      var datas =
                          (state.dataPrayTime.datetime[0].times).toJson();
                      // var datas = data.toJson();
                      print(datas.length);
                      print('datas ====> $datas');
                      return ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: datas.length,
                        itemBuilder: (context, index) {
                          var items = datas.entries.toList();
                          return ListTile(
                            leading: Text(items[index].key),
                            trailing: Text(items[index].value),
                          );
                        },
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            )
          ],
        ),
        //bottom navigation
        bottomNavigationBar: CurvedNavigationBar(
          index: _page,
          items: const <Widget>[
            Icon(Icons.access_time, size: 30, semanticLabel: 'Waktu Shalat'),
            Icon(Icons.mosque, size: 30, semanticLabel: 'Surat'),
            Icon(Icons.menu, size: 30, semanticLabel: 'Menu'),
          ],
          animationCurve: Curves.ease,
          animationDuration: const Duration(milliseconds: 500),
          buttonBackgroundColor: Constants.iblueLight,
          height: 60,
          onTap: (index) {
            print('tapped index- $index');
          },
        ),
      ),
    );
  }
}
