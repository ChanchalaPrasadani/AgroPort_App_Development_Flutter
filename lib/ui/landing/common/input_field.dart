import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget {
  final String hintTextValue;
  final bool obscureText;
  final bool enable;
  final TextInputType textInputType;
  final TextEditingController controller;
  const InputField(
      {Key? key,
      required this.hintTextValue,
      this.obscureText = false,
      this.enable = true,
      required this.textInputType,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h, bottom: 4.h, left: 30.w, right: 30.w),
      child: TextField(
        enabled: enable,
        controller: controller,
        obscureText: obscureText,
        keyboardType: textInputType,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(top: 4.h, bottom: 4.h, left: 15.w, right: 15.w),
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
          ),
          hintText: hintTextValue,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF707070)),
            borderRadius: BorderRadius.circular(15.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF707070)),
            borderRadius: BorderRadius.circular(15.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF707070)),
            borderRadius: BorderRadius.circular(15.w),
          ),
        ),
      ),
    );
  }
}
