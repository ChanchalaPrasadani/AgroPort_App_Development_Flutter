import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SnackBar customSnack({required BuildContext context, required String message}) {
  return SnackBar(
    duration: const Duration(seconds: 2),
    elevation: 0,
    margin: EdgeInsets.symmetric(horizontal: 5.w),
    backgroundColor: Colors.transparent,
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: 360.w,
          padding: EdgeInsets.symmetric(vertical: 7.5.h, horizontal: 5.w),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.65),
              borderRadius: BorderRadius.circular(5.h)),
          child: Text(message,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 15, color: Colors.white)),
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
  );
}
