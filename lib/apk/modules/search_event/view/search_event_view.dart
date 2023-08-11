import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tif/apk/global/color.dart';
import 'package:tif/apk/global/global.dart';
import 'package:tif/apk/modules/event/view/event_view.dart';
import 'package:tif/apk/modules/home/controller/home_controller.dart';
import 'package:tif/apk/modules/home/model/home_item_model.dart';
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
                  setState(() {});
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
                      // item to be search
                      String item = controller.search_controller.text
                          .trim()
                          .toLowerCase();

                      // title of event
                      String title = snapshot.data!.content.data[index].title
                          .toLowerCase();

                      customDate event_date_detail = global()
                          .getCorrectDateFormat(
                              snapshot.data!.content.data[index].dateTime);

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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '${event_date_detail.date} ${event_date_detail.month!.substring(0, 3)} -${event_date_detail.day!.substring(0, 3)} -${event_date_detail.time!}',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: appcolor().puple,
                                      ),
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
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 11.h,
                                    ),
                                    // Spacer(),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '${event_date_detail.date} ${event_date_detail.month!.substring(0, 3)} -${event_date_detail.day!.substring(0, 3)} -${event_date_detail.time!}',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: appcolor().puple,
                                      ),
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
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 11.h,
                                    ),
                                    // Spacer(),
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
