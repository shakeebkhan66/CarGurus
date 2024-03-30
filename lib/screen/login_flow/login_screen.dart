// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:carguru/controller/login_controller.dart';
import 'package:carguru/core/core.dart';
import 'package:carguru/core/dialogs.dart';
import 'package:carguru/provider/auth_provider/auth_provider.dart';
import 'package:carguru/screen/login_flow/resetpassword_screen.dart';
import 'package:carguru/screen/login_flow/signup_screen.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Custom_widget.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart' as prov;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/App_content.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  LoginController loginController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(6),
                    child: Image.asset(
                      Appcontent.close,
                      color: notifire.getwhiteblackcolor,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.size.height * 0.03,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign in to CarGuru".tr,
                          style: TextStyle(
                            fontFamily: FontFamily.gilroyBold,
                            color: notifire.getwhiteblackcolor,
                            fontSize: 28,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Welcome back! Please enter yout details.".tr,
                          style: TextStyle(
                            fontFamily: FontFamily.gilroyMedium,
                            fontSize: 15,
                            color: greyScale,
                          ),
                        ),
                        SizedBox(height: Get.size.height * 0.04),
                        textFormFild(
                          notifire,
                          controller: loginController.emali,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              "assets/mail.png",
                              height: 25,
                              width: 25,
                              color: greyColor,
                            ),
                          ),
                          labelText: "Email".tr,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email'.tr;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        GetBuilder<LoginController>(builder: (context) {
                          return textFormFild(
                            notifire,
                            controller: loginController.password,
                            obscureText: loginController.showPassword,
                            suffixIcon: InkWell(
                              onTap: () {
                                loginController.showOfPassword();
                              },
                              child: !loginController.showPassword
                                  ? Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        "assets/eye.png",
                                        height: 25,
                                        width: 25,
                                        color: greyColor,
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        "assets/eye-off.png",
                                        height: 25,
                                        width: 25,
                                        color: greyColor,
                                      ),
                                    ),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                "assets/lock.png",
                                height: 25,
                                width: 25,
                                color: greyColor,
                              ),
                            ),
                            labelText: "Password".tr,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password'.tr;
                              }
                              return null;
                            },
                          );
                        }),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Get.to(ResetPasswordScreen());
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Forgot password?".tr,
                                style: TextStyle(
                                  fontFamily: FontFamily.gilroyMedium,
                                  color: notifire.getwhiteblackcolor,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Reset it".tr,
                                style: TextStyle(
                                  fontFamily: FontFamily.gilroyBold,
                                  color: onbordingBlue,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.size.height * 0.03,
                        ),
                        GestButton(
                          height: 50,
                          Width: Get.size.width,
                          margin:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          buttoncolor: onbordingBlue,
                          buttontext: "Sign In".tr,
                          style: TextStyle(
                            color: WhiteColor,
                            fontFamily: FontFamily.gilroyBold,
                            fontSize: 15,
                          ),
                          onclick: () async {
                            // Get.offAll(BottomBarScreen());
                            // if (_formKey.currentState?.validate() ?? false) {}

                            if (_formKey.currentState?.validate() ?? false) {
                              try {
                                Dialogs.showLoadingDialog(context);
                                final authApi = ref.read(authProvider.notifier);
                                await authApi.login(
                                  email: loginController.emali.text,
                                  password: loginController.password.text,
                                );
                                if (!mounted) return;
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                Fluttertoast.showToast(
                                  msg: "logged in successfully",
                                );
                              } catch (e) {
                                debugPrint(e.toString());
                                if (!mounted) return;
                                Navigator.of(context, rootNavigator: true)
                                    .pop();

                                String? erroeMsg;
                                if (e is AppException) {
                                  erroeMsg = e.errorMessage;
                                }
                                Dialogs.showSimpleDialog(
                                  context,
                                  dismissLabel: "Ok",
                                  contentText:
                                      erroeMsg ?? "Something went wrong",
                                );
                              }
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        imageButton(
                          height: 50,
                          width: Get.size.width,
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          image: Appcontent.google,
                          buttonText: "Continue with Google".tr,
                          style: TextStyle(
                            fontFamily: FontFamily.gilroyMedium,
                            color: notifire.getwhiteblackcolor,
                            fontSize: 15,
                          ),
                          border: Border.all(color: notifire.getborderColor),
                          color: notifire.getblackwhitecolor,
                          onTap: () {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        imageButton(
                          height: 50,
                          width: Get.size.width,
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          image: notifire.isDark
                              ? Appcontent.apple
                              : 'assets/darkapple.png',
                          buttonText: "Continue with Apple".tr,
                          style: TextStyle(
                            fontFamily: FontFamily.gilroyMedium,
                            color: notifire.getwhiteblackcolor,
                            fontSize: 15,
                          ),
                          border: Border.all(color: notifire.getborderColor),
                          color: notifire.getblackwhitecolor,
                          onTap: () {},
                        ),
                        SizedBox(
                          height: Get.size.height * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Don’t have and account?".tr,
                              style: TextStyle(
                                fontFamily: FontFamily.gilroyMedium,
                                color: notifire.getwhiteblackcolor,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(SignUpScreen());
                              },
                              child: Text(
                                "Sign Up".tr,
                                style: TextStyle(
                                  fontFamily: FontFamily.gilroyBold,
                                  color: onbordingBlue,
                                  fontSize: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
