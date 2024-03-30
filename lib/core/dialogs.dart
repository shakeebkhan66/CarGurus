import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Dialogs {
  static Future<void> showLoadingDialog(
    BuildContext context, {
    String? loadingText = "Loading...",
  }) async {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text("$loadingText"),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: alert,
        );
      },
    );
  }

  static Future<void> showSimpleDialog(
    BuildContext context, {
    String? titleText,
    String? contentText,
    String primaryLabel = "Yes",
    String secondaryLabel = "No",
    String dismissLabel = "Dismiss",
    AsyncCallback? onPrimaryActionButton,
    AsyncCallback? onSecondaryActionButton,
    AsyncCallback? onDismiss,
  }) async {
    // final themedata = Get.put(GroceryThemecontroler());
    return await showDialog(
      builder: (context) => AlertDialog(
        // backgroundColor:
        //     themedata.isdark ? Grocerycolor.black : Grocerycolor.white,
        title: Text(
          titleText ?? "Car Guru".tr,
          textAlign: TextAlign.left,
          // style: poppinbold.copyWith(fontSize: 22),
        ),
        content: contentText == null
            ? null
            : Text(
                contentText,
                // style: poppinregular.copyWith(fontSize: 13),
              ),
        actionsAlignment: MainAxisAlignment.end,
        actions: [
          if (onPrimaryActionButton != null)
            ElevatedButton(
              // style: ElevatedButton.styleFrom(
              //     backgroundColor: Grocerycolor.greydark),
              onPressed: () async {
                try {
                  if (onSecondaryActionButton != null) {
                    await onSecondaryActionButton();
                  } else {
                    Navigator.of(context).pop();
                  }
                } catch (e) {
                  debugPrint("## $e");
                  Fluttertoast.showToast(msg: "something went wrong");
                }
              },
              child: Text(
                secondaryLabel,
                // style: poppinregular.copyWith(color: Grocerycolor.white),
              ),
            ),
          if (onPrimaryActionButton != null)
            ElevatedButton(
              onPressed: () async {
                try {
                  await onPrimaryActionButton();
                } catch (e) {
                  debugPrint("## $e");
                  Fluttertoast.showToast(msg: "something went wrong");
                }
              },
              // style: ElevatedButton.styleFrom(
              //     backgroundColor: Grocerycolor.primary),
              child: Text(
                primaryLabel,
                // style: poppinregular.copyWith(color: Grocerycolor.white),
              ),
            ),
          if (onPrimaryActionButton == null && onSecondaryActionButton == null)
            ElevatedButton(
              onPressed: () async {
                try {
                  if (onDismiss != null) {
                    await onDismiss();
                  } else {
                    Navigator.of(context).pop();
                  }
                } catch (e) {
                  debugPrint("## on_press_logout $e");
                }
              },
              // style:
              //     ElevatedButton.styleFrom(backgroundColor: Grocerycolor.grey),
              child: Text(
                dismissLabel,
                // style: poppinregular.copyWith(
                //   color: Grocerycolor.white,
                // ),
              ),
            )
        ],
      ),
      context: context,
    );
  }
}
