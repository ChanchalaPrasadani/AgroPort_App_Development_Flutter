import 'package:agro_port/ui/landing/common/background_effect.dart';
import 'package:agro_port/ui/landing/common/custom_button.dart';
import 'package:agro_port/ui/landing/sign_in_page/sign_in_page.dart';
import 'package:agro_port/ui/landing/sign_up_page/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectUserType extends StatefulWidget {
  final bool isLogin;
  const SelectUserType({Key? key, required this.isLogin}) : super(key: key);

  @override
  State<SelectUserType> createState() => _SelectUserTypeState();
}

class _SelectUserTypeState extends State<SelectUserType> {
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
      resizeToAvoidBottomInset: false,
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
              height: 10.h,
            ),
            Text("Select Your User Type",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 22.sp),
                textAlign: TextAlign.center),
            SizedBox(
              height: 300.h,
            ),
            CustomButton(
                text: "Farmer",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => widget.isLogin
                              ? const SignInPage(
                                  userRole: "Farmer",
                                )
                              : const SignUpPage(
                                  userRole: "Farmer",
                                )));
                }),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(
                text: "Seller",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => widget.isLogin
                              ? const SignInPage(
                                  userRole: "Seller",
                                )
                              : const SignUpPage(
                                  userRole: "Seller",
                                )));
                }),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(
                text: "Transpoter",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => widget.isLogin
                              ? const SignInPage(
                                  userRole: "Transpoter",
                                )
                              : const SignUpPage(
                                  userRole: "Transpoter",
                                )));
                }),
          ]),
        ),
      ),
    );
  }
}
