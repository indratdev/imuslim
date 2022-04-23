import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imuslim/screens/surah/surah_screen.dart';
import 'package:imuslim/state/bloc/searchsurah_bloc.dart';

import '../../../data/models/surah_model.dart';

class SearchSurah extends StatelessWidget {
  List<Data> dataSurah = [];
  SearchSurah({Key? key, required this.dataSurah}) : super(key: key);
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Surah'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.blue,
                )),
            child: TextField(
              maxLines: 1,
              decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.blue,
                hintText: 'Input Surah',
              ),
              onChanged: (value) {
                isSearch = true;
                context
                    .read<SearchsurahBloc>()
                    .add(GetSearchSurah(query: value, masterData: dataSurah));
              },
            ),
          ),
          BlocBuilder<SearchsurahBloc, SearchsurahState>(
            builder: (context, state) {
              if (state is SuccessGetSearchSurah) {
                List<Data> data = [];
                (isSearch) ? data = state.value : [];
                return listviewBody(data: data);
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
