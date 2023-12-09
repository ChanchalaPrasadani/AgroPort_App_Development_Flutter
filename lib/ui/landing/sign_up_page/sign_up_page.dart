import 'package:agro_port/ui/landing/common/background_effect.dart';
import 'package:agro_port/ui/landing/common/input_field.dart';
import 'package:agro_port/ui/landing/common/submit_button.dart';
import 'package:agro_port/ui/landing/sign_up_page/select_photograph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatefulWidget {
  final String userRole;
  const SignUpPage({Key? key, required this.userRole}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late Image image;
  late TextEditingController _nameController;
  late TextEditingController _usernameController;
  late TextEditingController _nicController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    image = Image.asset(
      "assets/images/logo.png",
      width: 150.w,
      height: 150.w,
      fit: BoxFit.fill,
    );
    _nameController = TextEditingController();
    _usernameController = TextEditingController();
    _nicController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _nicController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
      // resizeToAvoidBottomInset: false,
      body: BackgroundEffect(
        beginColor: const Color(0xFF4B91F1),
        endColor: const Color(0xFF334155),
        stopsValue: .7,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Column(children: [
              SizedBox(
                height: 40.h,
              ),
              Text("${widget.userRole} Registration",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 27.sp),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 50.h,
              ),
              InputField(
                  hintTextValue: "Name",
                  textInputType: TextInputType.text,
                  controller: _nameController),
              SizedBox(
                height: 10.h,
              ),
              InputField(
                hintTextValue: "Username",
                textInputType: TextInputType.text,
                controller: _usernameController,
              ),
              SizedBox(
                height: 10.h,
              ),
              InputField(
                  hintTextValue: "NIC No",
                  textInputType: TextInputType.text,
                  controller: _nicController),
              SizedBox(
                height: 10.h,
              ),
              InputField(
                hintTextValue: "Mobile No",
                textInputType: TextInputType.number,
                controller: _phoneController,
              ),
              SizedBox(
                height: 10.h,
              ),
              InputField(
                hintTextValue: "Password",
                textInputType: TextInputType.text,
                controller: _passwordController,
                obscureText: true,
              ),
              SizedBox(
                height: 10.h,
              ),
              InputField(
                hintTextValue: "Re-Type Password",
                textInputType: TextInputType.text,
                controller: _confirmPasswordController,
                obscureText: true,
              ),
              SizedBox(
                height: 60.h,
              ),
              SubmitButton(
                  text: "Next",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                SelectPhotograph(userRole: widget.userRole)));
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}
