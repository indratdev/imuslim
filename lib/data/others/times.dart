import 'package:imuslim/data/models/datetimes_pray.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Times {
  String _times = '';

  get getCurrentTime => _times;

  set setCurrenTime(String value) {}

  String currentTime() {
    initializeDateFormatting();
    DateFormat dateFormat = DateFormat.yMMMMd('id');
    // DateFormat timeFormat = new DateFormat.Hms('id'); // kalau mau ambil sama jamnya
    return dateFormat.format(DateTime.now());
  }

  String currentDate() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  
}
