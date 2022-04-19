import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imuslim/state/praybloc/pray_bloc.dart';
import 'package:imuslim/state/surahbloc/surah_bloc.dart';
import 'package:imuslim/util/constants.dart';

import '../../data/models/surah_model.dart';

class SurahScreen extends StatefulWidget {
  SurahScreen({Key? key}) : super(key: key);

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Data> _data = [];
  List<Data> _dataSurah = [];

  void filterSearchResult(String query) {
    List<Data> dummySearchList = [];
    dummySearchList.addAll(_dataSurah);
    if (query.isNotEmpty) {
      List<Data> dummyListData = [];
      for (var element in dummySearchList) {
        if (element.name.transliteration.id
            .toLowerCase()
            .contains(query.toLowerCase())) {
          dummyListData.add(element);
        }
      }
      setState(() {
        _dataSurah.clear();
        _dataSurah.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        _dataSurah.clear();
        BlocProvider.of<PrayBloc>(context).add(GetAllSurah());
        _dataSurah.addAll(_data);
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          BlocBuilder<PrayBloc, PrayState>(
            builder: (context, state) {
              if (state is FailureSurah) {
                return Center(child: Text('Error : ${state.info.toString()}'));
              }

              if (state is LoadingSurah) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              }

              if (state is SuccessGetSurah) {
                var data = state.surah.data;
                _data = data;
                _dataSurah = data;

                return Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 7,
                                color: Colors.grey,
                              )
                            ]),
                        child: TextField(
                          controller: _searchController,
                          maxLines: 1,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            prefixIconColor: Colors.white,
                            hintText: 'Cari Surah',
                            hintStyle: TextStyle(color: Constants.iwhite),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            if (value.isEmpty) {
                              print('empyt');
                            }
                            // if (value.length > 3) {
                            filterSearchResult(value);
                            // } else {
                            //   setState(() {
                            //     _dataSurah.clear();
                            //     _dataSurah.addAll(_data);
                            //   });
                            // }
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _dataSurah.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                context.read<SurahBloc>().add(ViewDetailSurah(
                                    number: _dataSurah[index].number));
                                // check have you ever read
                                context.read<SurahBloc>().add(GetLastAyatSurah(
                                    surah: _dataSurah[index]
                                        .name
                                        .transliteration
                                        .id));

                                Navigator.pushNamed(context, '/surahdetail');
                              },
                              child: ListTile(
                                leading: Text('${_dataSurah[index].number}.'),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_dataSurah[index]
                                        .name
                                        .transliteration
                                        .id),
                                    Text(
                                      _dataSurah[index].name.translation.id +
                                          ' (' +
                                          _dataSurah[index]
                                              .numberOfVerses
                                              .toString() +
                                          ') ',
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Text(
                                  _dataSurah[index].name.short,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
