import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageLoader {
  static showLoader(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(.2),
      context: context,
      builder: (BuildContext context) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.transparent,
              ),
              height: 30.w,
              width: 30.w,
              child: const CircularProgressIndicator(),
            ),
          ],
        );
      },
    );
  }
}
