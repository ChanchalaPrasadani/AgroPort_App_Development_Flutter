import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const SubmitButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50.h,
        width: 150.w,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
        child: Text(text,
            style: TextStyle(
                color: const Color(0xFF3C7DD9),
                fontWeight: FontWeight.w700,
                fontSize: 20.sp),
            textAlign: TextAlign.center),
      ),
    );
  }
}
