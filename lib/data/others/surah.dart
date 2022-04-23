import 'package:imuslim/data/models/surah_model.dart';

class Surah {
  List<Data> getSearchSurah(String query, List<Data> masterData) {
    List<Data> duplicateData = masterData;
    List<Data> dataSurah = [];
    try {
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
        dataSurah.addAll(dummyListData);
      } else {
        dataSurah.addAll(duplicateData);
      }
      return dataSurah;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
