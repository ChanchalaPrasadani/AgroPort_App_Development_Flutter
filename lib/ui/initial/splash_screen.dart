import 'package:agro_port/ui/landing/common/background_effect.dart';
import 'package:agro_port/ui/landing/common/custom_painter.dart';
import 'package:agro_port/ui/landing/language_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Image image;

  @override
  void initState() {
    super.initState();
    image = Image.asset(
      "assets/images/logo.png",
      width: 250.w,
      height: 250.w,
      fit: BoxFit.fill,
    );
    Future.delayed(const Duration(seconds: 3), (() {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LanguageSelectPage()));
    }));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Align(
            alignment: Alignment.bottomCenter,
            child: BackgroundEffect(
              beginColor: Color(0xFF334155),
              endColor: Color(0xFF4B91F1),
              stopsValue: 1.0,
              child: null,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: MyPainter(),
              child: Container(
                alignment: Alignment.center,
                color: const Color(0xFF8DBDFF).withOpacity(.3),
                height: 150.h,
              ),
            ),
          ),
          image,
        ],
      ),
    );
  }
}
