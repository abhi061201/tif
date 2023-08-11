import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tif/apk/global/color.dart';
import 'package:tif/apk/global/global.dart';
import 'package:tif/apk/modules/home/model/home_item_model.dart';
import 'package:readmore/readmore.dart';

class event_view extends StatelessWidget {
  Data eventdata;
  event_view({super.key, required this.eventdata});

  @override
  Widget build(BuildContext context) {
    customDate custom_date = global().getCorrectDateFormat(eventdata.dateTime);
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          floatingActionButton: Container(
            // margin:EdgeInsets.symmetric(horizontal: 55.w) ,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            height: 58.h,
            width: 271.w,
            decoration: BoxDecoration(
              color: appcolor().blueTextcolor,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20.0,
                  color: Color.fromARGB(181, 255, 255, 255),
                  spreadRadius: 30,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Text(
                  'Book Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: appcolor().darkBlue,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ).paddingOnly(left: Get.width * 0.1, right: Get.width * 0.1),
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 221.h,
                  title: Text(
                    eventdata.title,
                    style: TextStyle(fontSize: 24.sp),
                  ),
                  // backgroundColor: Colors.,
                  // floating: true,
                  actions: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 1.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 0.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: const Color(0xff979797).withOpacity(0.6),
                        ),
                        child: Icon(
                          Icons.bookmark,
                        ),
                      ),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      child: Image(
                        image: NetworkImage(
                          eventdata.bannerImage,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    collapseMode: CollapseMode.parallax,
                  ),
                ),
                SliverList.list(
                  children: [
                    Container(
                      child: Text(
                        eventdata.title,
                        style: TextStyle(
                          fontSize: 35.sp,
                          color: Colors.black,
                        ),
                      ),
                    ).paddingOnly(left: 24.w, top: 21.h, right: 24.w),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            right: 10.w,
                          ),
                          height: orientation == Orientation.portrait
                              ? Get.height * 0.065
                              : Get.height * 0.15,
                          width:orientation == Orientation.portrait? Get.width*0.14: Get.width*0.07,
                          child: checkSvg(eventdata.organiserIcon!) == false
                              ? Image(
                                  image: NetworkImage(
                                    eventdata.organiserIcon.toString(),
                                  ),
                                  fit: BoxFit.fill,
                                )
                              : SvgPicture.network(eventdata.organiserIcon),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                eventdata.organiserName,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Organiser',
                                style: TextStyle(
                                  color: appcolor().greycolor,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).paddingOnly(left: 24.w, top: 21.h, right: 24.w),

                    // isme work hoga
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            right: 10.w,
                          ),
                          height: orientation == Orientation.portrait
                              ? Get.height * 0.065
                              : Get.height * 0.15,
                          // width: 54.w,
                          child: Image(
                            image: AssetImage(
                              'assets/images/Date.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                '${custom_date.date} ${custom_date.month}, ${custom_date.year}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    '${custom_date.day}, ${custom_date.time} ',
                                    style: TextStyle(
                                      color: appcolor().greycolor,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).paddingOnly(left: 24.w, top: 21.h, right: 24.w),

                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            right: 10.w,
                          ),
                          height: orientation == Orientation.portrait
                              ? Get.height * 0.065
                              : Get.height * 0.15,
                          child: Image(
                            image: AssetImage(
                              'assets/images/Location.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // height: Get.height * 0.1,
                              width: Get.width * 0.7,
                              child: Text(
                                eventdata.venueName,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                ),
                                // maxLines: 2,
                                // overflow: TextOverflow.e,
                              ),
                            ),
                            Container(
                              width: Get.width * 0.7,
                              child: Text(
                                '${eventdata.venueCity}, ${eventdata.venueCountry}',
                                style: TextStyle(
                                  color: appcolor().greycolor,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).paddingOnly(left: 24.w, top: 21.h, right: 24.w),

                    Container(
                      child: Text(
                        'About Event',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                        ),
                      ),
                    ).paddingOnly(left: 24.w, top: 21.h, right: 24.w),

                    Container(
                      width: Get.width,
                      child: ReadMoreText(
                        '${eventdata.description}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                        trimLines: 5,
                        trimCollapsedText: 'Read More',
                        trimExpandedText: 'Read Less',
                      ),
                    ).paddingOnly(left: 24.w, top: 21.h, right: 24.w),

                    // to check sliver effect
                    SizedBox(
                      height: 150,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool checkSvg(String str) {
    if (str.substring(str.length - 3) == 'svg') {
      log('true');
      return true;
    }
    return false;
  }
}
