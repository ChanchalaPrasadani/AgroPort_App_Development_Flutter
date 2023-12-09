import 'package:agro_port/ui/landing/auth_main_page.dart';
import 'package:agro_port/ui/landing/common/background_effect.dart';
import 'package:agro_port/ui/landing/common/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late TextEditingController _codeController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _codeController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
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
            children: [
              SizedBox(height: 50.h),
              Text(
                "Reset Password",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 27.sp),
              ),
              SizedBox(height: 100.h),
              InputField(
                controller: _codeController,
                textInputType: TextInputType.number,
                hintTextValue: "Enter Code",
              ),
              SizedBox(height: 10.h),
              InputField(
                controller: _newPasswordController,
                textInputType: TextInputType.text,
                hintTextValue: "New Password",
              ),
              SizedBox(height: 10.h),
              InputField(
                controller: _confirmPasswordController,
                textInputType: TextInputType.text,
                hintTextValue: "Re-Type Password",
              ),
              SizedBox(
                height: 225.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthMainPage()),
                      (route) => false);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.white,
                  ),
                  height: 45.h,
                  width: 220.w,
                  child: Text(
                    "Reset Password",
                    style: TextStyle(
                        color: const Color(0xFF3C7DD9),
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
