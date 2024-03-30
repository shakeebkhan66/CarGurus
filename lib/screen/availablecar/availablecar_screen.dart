// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:carguru/controller/favorite_controller.dart';
import 'package:carguru/core/exception/handle_exceptions.dart';
import 'package:carguru/provider/car_provider.dart';
import 'package:carguru/screen/availablecar/filter_screen.dart';
import 'package:carguru/screen/detailcar/cardetails_screen.dart';
import 'package:carguru/utils/App_content.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart' as prov;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class AvailablecarScreen extends ConsumerStatefulWidget {
  const AvailablecarScreen({super.key});

  @override
  ConsumerState<AvailablecarScreen> createState() => _AvailablecarScreenState();
}

class _AvailablecarScreenState extends ConsumerState<AvailablecarScreen> {
  FavoriteController favoriteController = Get.find();
  late ColorNotifire notifire;
  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    getdarkmodepreviousstate();
    super.initState();
    favoriteController.changShimmer();
  }

  List text = [
    'Filter',
    'Recommended',
    'Free test drive',
  ];

  @override
  Widget build(BuildContext context) {
    notifire = prov.Provider.of<ColorNotifire>(context, listen: true);

    final availableCarP = ref.watch(availableCarPProvider);

    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            padding: EdgeInsets.all(12),
            child: Image.asset(
              Appcontent.back,
              color: notifire.getwhiteblackcolor,
            ),
          ),
        ),
        title: Text(
          "Available cars",
          style: TextStyle(
            fontFamily: FontFamily.gilroyBold,
            fontSize: 15,
            color: notifire.getwhiteblackcolor,
          ),
        ),
        actions: [
          Image.asset(
            Appcontent.search,
            height: 24,
            width: 24,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: GetBuilder<FavoriteController>(builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: text.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        index == 0
                            ? Navigator.of(context).push(_createRoute())
                            : SizedBox();
                      },
                      child: Container(
                        height: 55,
                        width: index == 0
                            ? 71
                            : index == 1
                                ? 153
                                : 130,
                        margin: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 10, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              text[index],
                              style: TextStyle(
                                fontFamily: FontFamily.gilroyMedium,
                                fontSize: 15,
                                color: notifire.getwhiteblackcolor,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            index == 1
                                ? Image.asset(
                                    "assets/chevron-down.png",
                                    height: 15,
                                    width: 15,
                                    color: notifire.getwhiteblackcolor,
                                  )
                                : SizedBox(),
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: notifire.getborderColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                ),
              ),
              availableCarP.when(
                data: (carlist) {
                  if ((carlist.isEmpty)) {
                    return Expanded(
                      child: Center(
                        child: Text("Empty Car List"),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: carlist.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Get.to(CarDetailsScreen());
                              Get.to(() => CarDetailsScreen(
                                    cardDetail: carlist[index],
                                  ));
                            },
                            child: Container(
                              height: 160,
                              width: Get.size.width,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 90,
                                        width: 140,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                AssetImage('assets/jeep.png'),
                                            // NetworkImage(
                                            //     carlist[index]?.logo ?? "",),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              carlist[index]?.model ?? "__",
                                              style: TextStyle(
                                                fontFamily:
                                                    FontFamily.gilroyBold,
                                                fontSize: 15,
                                                color:
                                                    notifire.getwhiteblackcolor,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  carlist[index]?.brand ?? "__",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        FontFamily.gilroyBold,
                                                    fontSize: 15,
                                                    color: greyScale1,
                                                  ),
                                                ),
                                                Spacer(),
                                                Image.asset(
                                                  "assets/star.png",
                                                  height: 16,
                                                  width: 16,
                                                ),
                                                Text(
                                                  // "5.0",
                                                  "0",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        FontFamily.gilroyMedium,
                                                    color: greyScale1,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Divider(
                                    color: greyScale,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/engine.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        // "540 hp",
                                        "__",
                                        style: TextStyle(
                                          fontFamily: FontFamily.gilroyMedium,
                                          color: greyScale1,
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset(
                                        "assets/manual-gearbox.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        // "Automatic",
                                        "__",
                                        style: TextStyle(
                                          fontFamily: FontFamily.gilroyMedium,
                                          color: greyScale1,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        // "\$176,037.11",
                                        "__",
                                        style: TextStyle(
                                          fontFamily: FontFamily.gilroyBold,
                                          color: notifire.getwhiteblackcolor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: notifire.getborderColor),
                                color: notifire.getblackwhitecolor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
                error: (error, stackTrace) {
                  return Expanded(
                      child: Center(
                    child: Text(
                      error is AppException
                          ? error.errorMessage
                          : "Something went wrong",
                    ),
                  ));
                },
                loading: () {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return awailableCarShimmer();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  awailableCarShimmer() {
    return Container(
      height: 175,
      width: Get.size.width,
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Shimmer.fromColors(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 90,
                  width: 140,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: notifire.getblackwhitecolor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 25,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: notifire.getblackwhitecolor,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 25,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: notifire.getblackwhitecolor,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 25,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: notifire.getblackwhitecolor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Divider(
              color: greyScale,
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Container(
                  height: 25,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: notifire.getblackwhitecolor,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Container(
                  height: 25,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: notifire.getblackwhitecolor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Spacer(),
                Container(
                  height: 25,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: notifire.getblackwhitecolor,
                  ),
                ),
              ],
            )
          ],
        ),
        baseColor: notifire.isDark ? Colors.black45 : Colors.grey.shade100,
        highlightColor: notifire.isDark ? Color(0xFF475569) : Color(0xFFeaeff4),
        enabled: true,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: notifire.getborderColor),
        color: notifire.getblackwhitecolor,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FilterScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
