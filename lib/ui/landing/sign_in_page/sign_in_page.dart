import 'package:agro_port/ui/landing/common/background_effect.dart';
import 'package:agro_port/ui/landing/common/input_field.dart';
import 'package:agro_port/ui/landing/common/submit_button.dart';
import 'package:agro_port/ui/landing/forgot_password/verification_code_page.dart';
import 'package:agro_port/ui/mp/bottom_navbar/bottom_navbar.dart';
import 'package:agro_port/widgets/page_loader.dart';
import 'package:agro_port/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPage extends StatefulWidget {
  final String userRole;
  const SignInPage({Key? key, required this.userRole}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late Image image;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    image = Image.asset(
      "assets/images/logo.png",
      width: 150.w,
      height: 150.w,
      fit: BoxFit.fill,
    );
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image.image, context);
  }

  _validateLogin() {
    if (_usernameController.text.isEmpty) {
      ScaffoldMessenger.maybeOf(context)!.showSnackBar(
          customSnack(context: context, message: 'Username field is empty'));
      return false;
    }
    if (_passwordController.text.isEmpty) {
      ScaffoldMessenger.maybeOf(context)!.showSnackBar(
          customSnack(context: context, message: 'Password field is empty'));
      return false;
    }
    return true;
  }

  _doLogin() async {
    if (_validateLogin()) {
      PageLoader.showLoader(context);
      await Future.delayed(const Duration(seconds: 3), () {});
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavBar(userRole: widget.userRole)),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: BackgroundEffect(
        beginColor: const Color(0xFF4B91F1),
        endColor: const Color(0xFF334155),
        stopsValue: .7,
        child: SizedBox(
          height: 800.h,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  image,
                  SizedBox(
                    height: 25.h,
                  ),
                  Text("Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 27.sp),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 40.h,
                  ),
                  InputField(
                    hintTextValue: "email",
                    textInputType: TextInputType.text,
                    controller: _usernameController,
                    //onSaved: (input) => requstModel.email = input
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InputField(
                    hintTextValue: "password",
                    textInputType: TextInputType.text,
                    controller: _passwordController,
                    obscureText: true,
                    //onSaved: (input) => requstModel.email = input
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VerificationCodePage()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 330.w,
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.w,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SubmitButton(
                    text: "Sign In",
                    onTap: () => _doLogin(),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
