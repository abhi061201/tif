import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tif/apk/global/color.dart';
import 'package:tif/apk/modules/event/view/event_view.dart';
import 'package:tif/apk/modules/home/controller/home_controller.dart';
import 'package:tif/apk/modules/search_event/controller/search_controller.dart';

class search_event_view extends StatefulWidget {
  search_event_view({super.key});

  @override
  State<search_event_view> createState() => _search_event_viewState();
}

class _search_event_viewState extends State<search_event_view> {
  home_contoller hController = Get.put(home_contoller());

  searchController controller = Get.put(searchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.08,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Center(
              child: TextFormField(
                controller: controller.search_controller,
                onChanged: (val) {
                  controller.searched_item.value = val;
                  setState(() {
                    
                  });
                  // log(controller.searched_item.value);
                },
                style: TextStyle(
                  color: appcolor().greycolor,
                ),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintStyle: TextStyle(
                    color: appcolor().greycolor,
                  ),
                  border: InputBorder.none,
                  hintText: 'Type Event Name',
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: hController.getItemList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    itemCount: snapshot.data!.content.data.length,
                    itemBuilder: (context, index) {
                      String item = controller.search_controller.text.trim().toLowerCase();
                      String title= snapshot.data!.content.data[index].title.toLowerCase();
                          
                          
                      if (item.isEmpty) {
                        return InkWell(
                          onTap: () {
                            Get.to(event_view(
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
                                        snapshot.data!.content.data[index]
                                            .bannerImage,
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
                                          // '${datetime.day.toString().substring(0, 3)}, ${datetime.month!.substring(0, 3)} ${datetime.date!} ',
                                          '',
                                          style: TextStyle(
                                            color: appcolor().blueTextcolor,
                                            fontSize: 14.sp,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Icon(
                                          Icons.circle,
                                          color: appcolor().blueTextcolor,
                                          size: 7.h,
                                        ),
                                        Text(
                                          // " " + datetime.time.toString(),
                                          '',
                                          style: TextStyle(
                                            color: appcolor().blueTextcolor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Container(
                                      width: Get.width * 0.5,
                                      child: Text(
                                        snapshot
                                            .data!.content.data[index].title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 11.h,
                                    ),
                                    // Spacer(),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          size: 16.h,
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

                                        // Icon(
                                        //   Icons.circle,
                                        //   color: appcolor().greycolor,
                                        //   size: 5.h,
                                        // ),
                                        // Text(
                                        //   ' ${snapshot.data!.content.data[index].venueCountry}',
                                        //   style: TextStyle(
                                        //     color: appcolor().greycolor,
                                        //     fontSize: 15,
                                        //   ),

                                        //   overflow: TextOverflow.ellipsis,
                                        // ),
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
                      } else if (title.contains(item)) {
                        return InkWell(
                          onTap: () {
                            // Get.back();
                            Get.to(event_view(
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
                                        snapshot.data!.content.data[index]
                                            .bannerImage,
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
                                          // '${datetime.day.toString().substring(0, 3)}, ${datetime.month!.substring(0, 3)} ${datetime.date!} ',
                                          '',
                                          style: TextStyle(
                                            color: appcolor().blueTextcolor,
                                            fontSize: 14.sp,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Icon(
                                          Icons.circle,
                                          color: appcolor().blueTextcolor,
                                          size: 7.h,
                                        ),
                                        Text(
                                          // " " + datetime.time.toString(),
                                          '',
                                          style: TextStyle(
                                            color: appcolor().blueTextcolor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Container(
                                      width: Get.width * 0.5,
                                      child: Text(
                                        snapshot
                                            .data!.content.data[index].title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 11.h,
                                    ),
                                    // Spacer(),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          size: 16.h,
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

                                        // Icon(
                                        //   Icons.circle,
                                        //   color: appcolor().greycolor,
                                        //   size: 5.h,
                                        // ),
                                        // Text(
                                        //   ' ${snapshot.data!.content.data[index].venueCountry}',
                                        //   style: TextStyle(
                                        //     color: appcolor().greycolor,
                                        //     fontSize: 15,
                                        //   ),

                                        //   overflow: TextOverflow.ellipsis,
                                        // ),
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

                      } else {
                        return Container();
                        
                      }
                    },
                  );
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
