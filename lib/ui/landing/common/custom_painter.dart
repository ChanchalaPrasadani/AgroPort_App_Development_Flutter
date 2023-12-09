import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final height = 150.h;
    final width = 360.w;
    path.lineTo(0, height);
    path.quadraticBezierTo(
        width / 4, height - 80.h, .65 * width, height - 20.h);
    path.quadraticBezierTo(.85 * width, height, width, height - 25.h);
    path.lineTo(width, 0);

    return path;
  }

  @override
  bool shouldReclip(oldClipper) => true;
}
