import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imuslim/state/praybloc/pray_bloc.dart';
import 'package:imuslim/state/surahbloc/surah_bloc.dart';

import '../../data/models/surah_model.dart';

class SurahScreen extends StatefulWidget {
  const SurahScreen({Key? key}) : super(key: key);

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  TextEditingController searchController = TextEditingController();
  List<Data> duplicateData = [];
  List<Data> items = [];

  @override
  void initState() {
    items.addAll(duplicateData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void filterSurah(String query) {
      List<Data> dummySearchList = [];
      dummySearchList.addAll(duplicateData);

      if (query.isNotEmpty) {
        List<Data> dummyListData = [];
        for (var item in dummySearchList) {
          if (item.name.transliteration.id
              .toLowerCase()
              .contains(query.toLowerCase())) {
            dummyListData.add(item);
          }
        }
        setState(() {
          items.clear();
          items.addAll(dummyListData);
        });
        return;
      } else {
        setState(() {
          items.clear();
          items.addAll(duplicateData);
        });
      }
    }

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
                var dataSurah = state.surah.data;
                duplicateData = dataSurah;

                return Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 25,
                        margin: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.blue,
                        ),
                        child: TextField(
                          controller: searchController,
                          maxLines: 1,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            hintText: 'Surah...',
                            hintStyle: TextStyle(color: Colors.white),
                            contentPadding:
                                EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          onChanged: (value) {
                            filterSurah(value);
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                context.read<SurahBloc>().add(ViewDetailSurah(
                                    number: items[index].number));
                                // check have you ever read
                                context.read<SurahBloc>().add(GetLastAyatSurah(
                                    surah:
                                        items[index].name.transliteration.id));

                                Navigator.pushNamed(context, '/surahdetail');
                              },
                              child: ListTile(
                                leading: Text('${items[index].number}.'),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(items[index].name.transliteration.id),
                                    Text(
                                      items[index].name.translation.id +
                                          ' (' +
                                          items[index]
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
                                  items[index].name.short,
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
