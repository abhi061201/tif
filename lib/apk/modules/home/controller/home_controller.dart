import 'dart:convert';
import 'dart:developer';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:tif/apk/global/urls.dart';
import 'package:tif/apk/modules/home/model/home_item_model.dart';
import 'package:http/http.dart ' as http;

class home_contoller extends GetxController {
  Future<HomeItemModel> getItemList() async {
    HomeItemModel home_item_data;

    final response = await http.get(Uri.parse(apk_url().eventUrl));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      home_item_data = HomeItemModel.fromJson(data);
    } else {
      home_item_data = HomeItemModel.fromJson(data);
    }

    // log(home_item_data.content.data[0].bannerImage.toString());
    return home_item_data;
  }
   customDate getCorrectDateFormat(String date) {
    customDate obj = customDate();
    String tempdate = date.substring(0, 10) + ' ' + date.substring(11, 19);
    DateTime correctDate = DateTime.parse(tempdate);

    obj.day= DateFormat('EEEE').format(correctDate);
    obj.date= DateFormat('dd').format(correctDate);
    obj.month= DateFormat('MMMM').format(correctDate);
    obj.year= DateFormat('yyyy').format(correctDate);
    obj.time= DateFormat('h:mm a').format(correctDate);

    // String currentDay = DateFormat('EEEE').format(correctDate);
    // obj.current_day=DateFormat('EEEE').format(correctDate);
    // obj.full_month= DateFormat('MMMM').format(correctDate);
    // obj.current_year= DateFormat('yyyy').format(correctDate);

    // // obj.current_year
    // currentDay = currentDay.substring(0, 3);
    // obj.date = DateFormat('MMM').format(correctDate) +
    //     " " +
    //     DateFormat('dd').format(correctDate);
    // obj.day = currentDay;
    // obj.time = DateFormat('h:mm a').format(correctDate);
    
    // log( DateFormat('yyyy').format(correctDate));

    return obj;
  }
  
}
