import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imuslim/state/praybloc/pray_bloc.dart';
import 'package:imuslim/state/surahbloc/surah_bloc.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Qur' 'an',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          BlocBuilder<PrayBloc, PrayState>(
            builder: (context, state) {
              if (state is FailureSurah) {
                return Center(child: Text('Error : ${state.info.toString()}'));
              }
              if (state is LoadingSurah) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (state is SuccessGetSurah) {
                // BlocProvider.of<SurahBloc>(context)
                //     .add(ViewDetailSurah(number: 1)); // disini
                var data = state.surah.data;
                return Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print('selected: ${data[index].number}');
                          context
                              .read<SurahBloc>()
                              .add(ViewDetailSurah(number: data[index].number));
                        },
                        child: ListTile(
                          leading: Text('${data[index].number}.'),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index].name.transliteration.id),
                              Text(
                                data[index].name.translation.id +
                                    ' (' +
                                    data[index].numberOfVerses.toString() +
                                    ') ',
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          trailing: Text(
                            data[index].name.short,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
