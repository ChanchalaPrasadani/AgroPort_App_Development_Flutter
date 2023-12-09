import 'package:agro_port/ui/landing/common/background_effect.dart';
import 'package:agro_port/ui/landing/common/custom_button.dart';
import 'package:agro_port/ui/landing/select_user_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthMainPage extends StatefulWidget {
  const AuthMainPage({Key? key}) : super(key: key);

  @override
  State<AuthMainPage> createState() => _AuthMainPageState();
}

class _AuthMainPageState extends State<AuthMainPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundEffect(
        beginColor: const Color(0xFF4B91F1),
        endColor: const Color(0xFF334155),
        stopsValue: .7,
        child: SafeArea(
          child: Column(children: [
            SizedBox(
              height: 40.h,
            ),
            image,
            SizedBox(
              height: 20.h,
            ),
            Text("Welcome to \nAgri port",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 27.sp),
                textAlign: TextAlign.center),
            SizedBox(
              height: 300.h,
            ),
            CustomButton(
                text: "Login",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const SelectUserType(
                                isLogin: true,
                              )));
                }),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(
                text: "Register",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const SelectUserType(
                                isLogin: false,
                              )));
                }),
          ]),
        ),
      ),
    );
  }
}
