import 'dart:io';

import 'package:agro_port/ui/landing/auth_main_page.dart';
import 'package:agro_port/ui/landing/common/background_effect.dart';
import 'package:agro_port/ui/landing/common/submit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class SelectPhotograph extends StatefulWidget {
  final String userRole;
  const SelectPhotograph({Key? key, required this.userRole}) : super(key: key);

  @override
  State<SelectPhotograph> createState() => _SelectPhotographState();
}

class _SelectPhotographState extends State<SelectPhotograph> {
  Future<ImageSource?> showImageSource(BuildContext context) {
    if (Platform.isIOS) {
      return showCupertinoModalPopup<ImageSource>(
          context: context,
          builder: (context) => CupertinoActionSheet(actions: [
                CupertinoActionSheetAction(
                    onPressed: () =>
                        Navigator.of(context).pop(ImageSource.camera),
                    child: const Text("Camera")),
                CupertinoActionSheetAction(
                    onPressed: () =>
                        Navigator.of(context).pop(ImageSource.gallery),
                    child: const Text("Gallery")),
              ]));
    } else {
      return showModalBottomSheet<ImageSource>(
          context: context,
          builder: (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      leading: const Icon(Icons.camera_alt_outlined),
                      title: const Text("Camera"),
                      onTap: () =>
                          Navigator.of(context).pop(ImageSource.camera)),
                  ListTile(
                      leading: const Icon(Icons.image_outlined),
                      title: const Text("Gallery"),
                      onTap: () =>
                          Navigator.of(context).pop(ImageSource.gallery))
                ],
              ));
    }
  }

  final picker = ImagePicker();
  File? _image;

  Future getImage() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile == null) {
        return;
      } else {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to pick image : $e");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Failed to pick image : $e");
      }
    }
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
              height: 100.h,
            ),
            Text("${widget.userRole} Registration",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 27.sp),
                textAlign: TextAlign.center),
            SizedBox(
              height: 75.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.w),
                          child: _image != null
                              ? Image.file(
                                  _image!,
                                  height: 100.w,
                                  width: 100.w,
                                  fit: BoxFit.fill,
                                )
                              : Container(
                                  color: Colors.white,
                                  height: 100.w,
                                  width: 100.w,
                                ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await getImage();
                          },
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: _image == null
                                ? const Color(0xFF4680CF)
                                : Colors.white,
                            size: 35.w,
                          ),
                        ),
                      ],
                    ),
                    Text("Enter Your \nReal Photograph",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
                "It Is mandatory to remember the Username and \nPassword to login again",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp),
                textAlign: TextAlign.center),
            SizedBox(
              height: 40.h,
            ),
            SubmitButton(
                text: "Register",
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthMainPage()),
                      (route) => false);
                }),
          ]),
        ),
      ),
    );
  }
}
