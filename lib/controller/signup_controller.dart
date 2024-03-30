import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController implements GetxService {
  TextEditingController name = TextEditingController();
  TextEditingController emali = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  bool showPassword = false;
  bool showcPassword = false;

  showOfPassword() {
    showPassword = !showPassword;
    update();
  }

  showOfcPassword() {
    showcPassword = !showcPassword;
    update();
  }
}
