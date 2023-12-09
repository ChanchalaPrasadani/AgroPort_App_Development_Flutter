import 'package:agro_port/ui/landing/auth_main_page.dart';
import 'package:agro_port/ui/landing/common/background_effect.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late PageController _controller;
  int activeIndex = 0;
  List<Image> imgList = [];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    for (int i = 1; i < 4; i++) {
      imgList.add(Image.asset(
        'assets/images/$i.png',
        width: 300.w,
        height: 400.h,
        fit: BoxFit.fitHeight,
        alignment: Alignment.center,
      ));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var image in imgList) {
      precacheImage(image.image, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundEffect(
      beginColor: const Color(0xFF334155),
      endColor: const Color(0xFF4B91F1),
      stopsValue: 1.0,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  controller: _controller,
                  itemCount: imgList.length,
                  itemBuilder: (_, index) {
                    return OnBoardPage(
                      image: imgList[index],
                      index: index,
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: SwapEffect(
                  activeDotColor: const Color(0xFF334155),
                  dotColor: const Color(0xFFFFFFFF),
                  dotHeight: 15.h,
                  dotWidth: 15.h,
                  spacing: 15.h,
                  paintStyle: PaintingStyle.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class OnBoardPage extends StatelessWidget {
  final Image image;
  final int index;
  const OnBoardPage({Key? key, required this.image, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  if (kDebugMode) {
                    print("Skip press");
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AuthMainPage()),
                  );
                },
                child: SizedBox(
                  width: 50.w,
                  height: 40.h,
                  child: Text(
                    index != 2 ? "Skip" : '',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            ClipRRect(borderRadius: BorderRadius.circular(10.r), child: image),
            if (index == 2)
              Padding(
                padding: EdgeInsets.only(top: 75.h),
                child: GestureDetector(
                  onTap: () {
                    if (kDebugMode) {
                      print("Get Started press");
                    }
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthMainPage()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                    ),
                    height: 40.h,
                    width: 100.w,
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
