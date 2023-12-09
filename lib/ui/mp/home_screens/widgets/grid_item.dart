import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridItem extends StatelessWidget {
  final Map<String, dynamic> item;
  const GridItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      child: Column(
        children: [
          Container(
              width: 150.w,
              height: 150.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.h),
                color: Colors.white,
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.h),
                  child: Image.asset(item["url"], fit: BoxFit.fill))),
          SizedBox(
            height: 2.5.h,
          ),
          Text(
            item["name"] + " " + item["kg"].toString() + "kg",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
          Text(
            item["location"],
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
