



import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:tasks_app/core/utils/app_color.dart';

void showToast({required String message,required Color color}){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: color,
      textColor: AppColor.whiteColor,
      fontSize: 20.0
  );
}