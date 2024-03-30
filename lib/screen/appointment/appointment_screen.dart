// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:carguru/core/core.dart';
import 'package:carguru/provider/appointment_provider/appointment_provider.dart';
import 'package:carguru/screen/detailcar/cardetails_screen.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart' as prov;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/App_content.dart';

class AppointmentScreen extends ConsumerStatefulWidget {
  const AppointmentScreen({super.key});

  @override
  ConsumerState<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends ConsumerState<AppointmentScreen> {
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
  }

  @override
  Widget build(BuildContext context) {
    notifire = prov.Provider.of<ColorNotifire>(context, listen: true);
    final appointmentProv = ref.watch(appointmentPProvider);
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
            padding: EdgeInsets.all(12),
            child: Image.asset(
              "assets/back.png",
              color: notifire.getwhiteblackcolor,
            ),
          ),
        ),
        title: Text(
          "Appointment",
          style: TextStyle(
            fontFamily: FontFamily.gilroyBold,
            fontSize: 15,
            color: notifire.getwhiteblackcolor,
          ),
        ),
        actions: [
          Image.asset(Appcontent.calender,
              height: 24, width: 24, color: notifire.getwhiteblackcolor),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: notifire.getblackwhitecolor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: notifire.getbgcolor)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: notifire.getbgcolor)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: notifire.getbgcolor),
                  ),
                  hintText: 'Search message',
                  hintStyle: TextStyle(
                      fontFamily: FontFamily.gilroyMedium,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: notifire.getwhiteblackcolor),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(Appcontent.search,
                        height: 24,
                        width: 24,
                        color: notifire.getwhiteblackcolor),
                  ),
                ),
              ),
            ),
            appointmentProv.when(
              data: (apponitmentList) {
                return SizedBox(
                  height: Get.size.height,
                  width: Get.size.width,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: apponitmentList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(CarDetailsScreen());
                        },
                        child: Container(
                          height: 160,
                          width: Get.size.width,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/jeep.png"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          apponitmentList[index]?.description ??
                                              "__",
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontFamily:
                                                FontFamily.gilroyExtraBold,
                                            color: notifire.getwhiteblackcolor,
                                            fontSize: 16,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          apponitmentList[index]?.description ??
                                              "__",
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontFamily: FontFamily.gilroyMedium,
                                            color: greyScale,
                                            fontSize: 13,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Divider(
                                color: grey50,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Date",
                                          style: TextStyle(
                                            fontFamily: FontFamily.gilroyMedium,
                                            color: greyScale,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/calendar.png",
                                              height: 16,
                                              width: 16,
                                              color: onbordingBlue,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              apponitmentList[index]
                                                          ?.appointmentDate ==
                                                      null
                                                  ? "__"
                                                  : DateFormat()
                                                      .add_yMMMd()
                                                      .format(
                                                        DateTime.parse(
                                                          apponitmentList[
                                                                  index]!
                                                              .appointmentDate!,
                                                        ),
                                                      ),
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontFamily:
                                                    FontFamily.gilroyBold,
                                                color:
                                                    notifire.getwhiteblackcolor,
                                                fontSize: 14,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Time",
                                          style: TextStyle(
                                            fontFamily: FontFamily.gilroyMedium,
                                            color: greyScale,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/clock1.png",
                                              height: 16,
                                              width: 16,
                                              color: onbordingBlue,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                apponitmentList[index]
                                                            ?.appointmentDate ==
                                                        null
                                                    ? "__"
                                                    : DateFormat()
                                                        .add_jm()
                                                        .format(
                                                          DateTime.parse(
                                                            apponitmentList[
                                                                    index]!
                                                                .appointmentDate!,
                                                          ),
                                                        ),
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FontFamily.gilroyBold,
                                                  color: notifire
                                                      .getwhiteblackcolor,
                                                  fontSize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: notifire.getblackwhitecolor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: notifire.getborderColor),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              error: (error, stackTrace) {
                return Center(
                  child: Text(
                    error is AppException
                        ? error.errorMessage
                        : "Something went wrong",
                  ),
                );
              },
              loading: () {
                return SpinKitCircle(
                  size: 50,
                  color: Colors.blue,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
