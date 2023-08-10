import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:tif/apk/modules/home/model/home_item_model.dart';

class global {
  global();
  customDate getCorrectDateFormat(String date) {
    customDate obj = customDate();
    String tempdate = date.substring(0, 10) + ' ' + date.substring(11, 19);
    DateTime correctDate = DateTime.parse(tempdate);

    obj.day = DateFormat('EEEE').format(correctDate);
    obj.date = DateFormat('dd').format(correctDate);
    obj.month = DateFormat('MMMM').format(correctDate);
    obj.year = DateFormat('yyyy').format(correctDate);
    obj.time = DateFormat('h:mm a').format(correctDate);

    return obj;
  }
}
