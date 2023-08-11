import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tif/apk/global/color.dart';
import 'package:tif/apk/modules/event/view/event_view.dart';
import 'package:tif/apk/global/global.dart';
import 'package:tif/apk/modules/home/controller/home_controller.dart';
import 'package:tif/apk/modules/home/model/home_item_model.dart';
import 'package:tif/apk/modules/search_event/view/search_event_view.dart';

class Home_View extends StatelessWidget {
  Home_View({super.key});
  home_contoller controller = Get.put(home_contoller());
  global glob_obj = global();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Events',
          style: TextStyle(fontSize: 24.sp, color: Colors.black),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => search_event_view());
            },
            icon: Icon(
              Icons.search,
              size: 24.r,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              size: 24.r,
            ),
          )
        ],
      ),

      // main body
      body: Container(
        padding: EdgeInsets.only(left: 24.w, right: 24.w),

        // we take future builder as we got date from future funtion
        child: FutureBuilder(
          future: controller.getItemList(),
          builder: (context, snapshot) {
            // if data fetched from api
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.content.data.length,
                itemBuilder: (context, index) {
                  customDate datetime = glob_obj.getCorrectDateFormat(
                      snapshot.data!.content.data[index].dateTime.toString());
                  return InkWell(
                    onTap: () {
                      Get.to(() => event_view(
                          eventdata: snapshot.data!.content.data[index]));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      height: 106.h,
                      width: 327.w,
                      margin: EdgeInsets.symmetric(
                        vertical: 6.h,
                        horizontal: 2.w,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 8.w,
                              top: 7.h,
                              right: 15.w,
                            ),
                            height: 92.h,
                            width: 79.w,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(16.r),
                              image: DecorationImage(
                                image: NetworkImage(
                                  snapshot
                                      .data!.content.data[index].bannerImage,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${datetime.day.toString().substring(0, 3)}, ${datetime.month!.substring(0, 3)} ${datetime.date!} ',
                                    style: TextStyle(
                                      color: appcolor().blueTextcolor,
                                      fontSize: 15.sp,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: appcolor().blueTextcolor,
                                    size: 7.h,
                                  ),
                                  Text(
                                    " " + datetime.time.toString(),
                                    style: TextStyle(
                                      color: appcolor().blueTextcolor,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                width: Get.width * 0.5,
                                child: Text(
                                  snapshot.data!.content.data[index].title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              // Spacer(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    size: 14.h,
                                    color: appcolor().greycolor,
                                  ),
                                  Container(
                                    width: Get.width * 0.5,
                                    child: Text(
                                      ' ${snapshot.data!.content.data[index].venueName} ' +
                                          ' ${snapshot.data!.content.data[index].venueCity} ' +
                                          ' ${snapshot.data!.content.data[index].venueCountry.toUpperCase()}',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: appcolor().greycolor,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ).marginOnly(
                            top: 7.h,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            // if data is not arrived
            else if (!snapshot.hasData) {
              return Container(
                height: Get.height,
                width: Get.width,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff39bfb1),
                  ),
                ),
              );
            }
            // in any other cases
            else {
              return Container(
                height: Get.height,
                width: Get.width,
                child: Center(
                    child: Text('Something Went Wrong please try again...')),
              );
            }
          },
        ),
      ),
    );
  }
}
