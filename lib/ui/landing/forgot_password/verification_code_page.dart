import 'package:agro_port/ui/landing/common/background_effect.dart';
import 'package:agro_port/ui/landing/common/input_field.dart';
import 'package:agro_port/ui/landing/common/submit_button.dart';
import 'package:agro_port/ui/landing/forgot_password/reset_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({Key? key}) : super(key: key);

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneNumberController.dispose();
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
            child: Column(
              children: [
                SizedBox(height: 75.h),
                Text(
                  "Reset Password",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 27.sp),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 60.h),
                  child: Text(
                    "Enter  your mobile number you will be get a code with four digits to verification",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
                InputField(
                    hintTextValue: "Mobile No",
                    textInputType: TextInputType.number,
                    controller: _phoneNumberController),
                SizedBox(
                  height: 250.h,
                ),
                SubmitButton(
                    text: "Get Code",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ResetPasswordPage()));
                    })
              ],
            ),
          ),
        ));
  }
}
