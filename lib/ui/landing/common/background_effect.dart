import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundEffect extends StatelessWidget {
  final Widget? child;
  final Color beginColor;
  final Color endColor;
  final double stopsValue;
  const BackgroundEffect(
      {Key? key,
      required this.child,
      required this.beginColor,
      required this.endColor,
      required this.stopsValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              beginColor,
              endColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, stopsValue],
            tileMode: TileMode.clamp),
      ),
      height: 830.h,
      width: 360.w,
      child: child,
    );
  }
}
