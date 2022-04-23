import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imuslim/screens/surah/search_surah/searchsurah_screen.dart';
import 'package:imuslim/screens/widgets/appbar_reuseable.dart';
import 'package:imuslim/state/bloc/searchsurah_bloc.dart';
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
  TextEditingController searchController = TextEditingController();

  List<Data> dataSurah = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: headerNav(
          title: Constants.textQuran,
          action: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchSurah(dataSurah: dataSurah),
                  ),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            BlocBuilder<PrayBloc, PrayState>(
              builder: (context, state) {
                if (state is FailureSurah) {
                  return Center(
                      child: Text('Error : ${state.info.toString()}'));
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
                  dataSurah = data;

                  return Expanded(
                    child: Column(
                      children: [
                        listviewBody(data: data),
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
      ),
    );
  }
}

class listviewBody extends StatelessWidget {
  listviewBody({
    Key? key,
    required this.data,
  }) : super(key: key);

  List<Data> data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context
                  .read<SurahBloc>()
                  .add(ViewDetailSurah(number: data[index].number));
              // check have you ever read
              context.read<SurahBloc>().add(
                  GetLastAyatSurah(surah: data[index].name.transliteration.id));

              Navigator.pushNamed(context, '/surahdetail');
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
  }
}
