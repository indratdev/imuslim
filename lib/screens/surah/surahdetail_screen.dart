import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imuslim/data/others/shared_preferences.dart';
import 'package:imuslim/state/surahbloc/surah_bloc.dart';
import 'package:imuslim/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SurahDetailScreen extends StatelessWidget {
  const SurahDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Surah'),
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(
                Icons.settings,
              ),
            )
          ],
        ),
        body: BlocConsumer<SurahBloc, SurahState>(
          listener: (context, state) {
            if (state is SuccessMarkLastAyatSurah) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Berhasil Menandai Surah',
                    style: TextStyle(color: Colors.green),
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          builder: (context, state) {
            // loading surah
            if (state is LoadingSurahDetail) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is FailureSurahDetail) {
              return Center(child: Text(state.info.toString()));
            } else if (state is SuccessGetSurahDetail) {
              var data = state.data.data;

              return Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 5, right: 5),
                      child: Text(
                        data.name.transliteration.id +
                            ' (' +
                            data.name.translation.id +
                            ')' +
                            '\n' +
                            data.revelation.id +
                            ' ' +
                            data.numberOfVerses.toString() +
                            ' Ayat',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.numberOfVerses,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            var surah = data.name.transliteration.id.toString();
                            var ayat =
                                data.verses[index].number.inSurah.toString();
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => CupertinoActionSheet(
                                title: Text(surah + ' : Ayat ' + ayat),
                                actions: <Widget>[
                                  CupertinoActionSheetAction(
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    top: 5.0, left: 5),
                                            title: const Text(
                                              'Menandai Surah',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            content: Text(
                                                'Anda akan menandai terakhir baca pada surat $surah: ayat $ayat, yakin ?'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();

                                                  BlocProvider.of<SurahBloc>(
                                                          context)
                                                      .add(MarkLastAyatSurah(
                                                          surah: surah,
                                                          ayat: ayat));
                                                  BlocProvider.of<SurahBloc>(
                                                          context)
                                                      .add(ViewDetailSurah(
                                                          number: data.number));
                                                },
                                                child: const Text('OK'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'Batal',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: const Text('Tandai Terakhir Dibaca'),
                                  ),
                                ],
                                cancelButton: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel',
                                      style: TextStyle(color: Colors.red)),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(
                                10,
                              ),
                              color: index % 2 == 0
                                  ? Constants.iwhite
                                  : Constants.iblueLight,
                            ),
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 5, left: 5),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                            data.verses[index].number.inSurah
                                                .toString(),
                                            style: TextStyle(fontSize: 15)),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 8,
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        child: ListView(
                                          physics: ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          children: <Widget>[
                                            Text(
                                              data.verses[index].text.arab,
                                              textAlign: TextAlign.right,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(data.verses[index].text
                                                .transliteration.en
                                                .toString()),
                                            const SizedBox(height: 5),
                                            Text(
                                              data.verses[index].translation.id
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors
                                                      .blueAccent.shade200),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
