import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBulksButton extends StatelessWidget {
  const AddBulksButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      width: 360.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.h),
              color: const Color(0xFF4B91F1),
            ),
            child: Text(
              "Add Bulks",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
    );
  }
}
