import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imuslim/state/surahbloc/surah_bloc.dart';
import 'package:imuslim/util/constants.dart';

class SurahDetailScreen extends StatelessWidget {
  const SurahDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Surah'),
        ),
        body: BlocBuilder<SurahBloc, SurahState>(
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
                      margin: EdgeInsets.only(
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
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.numberOfVerses,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, right: 5, left: 5),
                          color: index % 2 == 0
                              ? Constants.iwhite
                              : Constants.iblueLight,
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
                                                color:
                                                    Colors.blueAccent.shade200),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
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
