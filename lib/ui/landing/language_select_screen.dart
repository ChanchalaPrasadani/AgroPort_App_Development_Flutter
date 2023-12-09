import 'package:agro_port/ui/landing/common/background_effect.dart';
import 'package:agro_port/ui/landing/common/custom_painter.dart';
import 'package:agro_port/ui/landing/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageSelectPage extends StatefulWidget {
  const LanguageSelectPage({Key? key}) : super(key: key);

  @override
  State<LanguageSelectPage> createState() => _LanguageSelectPageState();
}

class _LanguageSelectPageState extends State<LanguageSelectPage> {
  late Image image;

  @override
  void initState() {
    super.initState();
    image = Image.asset(
      "assets/images/logo.png",
      width: 150.w,
      height: 150.w,
      fit: BoxFit.fill,
    );
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

  _navigate() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnBoardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
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
            Positioned(top: 20.h, child: image),
            Positioned(
              top: 275.h,
              child: Text(
                "Select Language",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 25.sp),
              ),
            ),
            Positioned(
                top: 350.h,
                child: Column(
                  children: [
                    _languageButton("Sinhala", () {
                      _navigate();
                    }),
                    _languageButton("English", () {
                      _navigate();
                    }),
                    _languageButton("Tamil", () {
                      _navigate();
                    }),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  _languageButton(String _languageName, VoidCallback _onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: GestureDetector(
        onTap: _onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
          ),
          height: 40.h,
          width: 100.w,
          child: Text(
            _languageName,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15.sp),
          ),
        ),
      ),
    );
  }
}
