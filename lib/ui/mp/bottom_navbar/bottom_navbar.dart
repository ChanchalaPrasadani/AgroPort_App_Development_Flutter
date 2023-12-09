import 'package:agro_port/ui/landing/auth_main_page.dart';
import 'package:agro_port/ui/landing/common/submit_button.dart';
import 'package:agro_port/ui/mp/home_screens/home_main_page.dart';
import 'package:agro_port/ui/mp/my_sell/my_sell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  final String userRole;
  const BottomNavBar({Key? key, required this.userRole}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  late PageController pageController;
  DateTime? currentBackPressTime;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    pageController.jumpToPage(_selectedIndex);
  }

  void _onPageChanged(int index) {
    setState(() => _selectedIndex = index);
  }

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.maybeOf(context)!.showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 1750),
        elevation: 0,
        margin: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
        backgroundColor: Colors.transparent,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier*7.5)),
        content: Container(
          alignment: Alignment.center,
          height: 50.h,
          width: 330.w,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.65),
              borderRadius: BorderRadius.circular(20.r)),
          child: Center(
            child: Text("press back again to exit",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.sp, color: Colors.white)),
          ),
        ),
        behavior: SnackBarBehavior.floating,
      ));
      // print("press back to exit");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: SafeArea(
          child: PageView(
            children: <Widget>[
              // Container(
              //   alignment: Alignment.center,
              //   // height: 830.h,
              //   width: 360.w,
              //   color: Colors.red,
              //   child: Text("Yet to implement",
              //       style: TextStyle(color: Colors.white, fontSize: 20.sp),
              //       textAlign: TextAlign.center),
              // ),
              HomeMainPage(userRole: widget.userRole),
              const MySellPage(),
              // Container(
              //   alignment: Alignment.center,
              //   // height: 830.h,
              //   width: 360.w,
              //   color: Colors.blue,
              //   child: Text("Yet to implement",
              //       style: TextStyle(color: Colors.white, fontSize: 20.sp),
              //       textAlign: TextAlign.center),
              // ),
              Container(
                alignment: Alignment.center,
                // height: 830.h,
                width: 360.w,
                color: Colors.green,
                child: Text("Yet to implement",
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    textAlign: TextAlign.center),
              ),
              Container(
                alignment: Alignment.center,
                // height: 830.h,
                width: 360.w,
                color: Colors.deepOrange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Yet to implement",
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 20.h,
                    ),
                    SubmitButton(
                        text: "Log Out",
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AuthMainPage()),
                              (route) => false);
                        })
                  ],
                ),
              )
            ],
            controller: pageController,
            onPageChanged: _onPageChanged,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: GNav(
            curve: Curves.easeInCubic,
            rippleColor: const Color(0xff3458F5),
            hoverColor: const Color(0xff3458F5),
            gap: 8.w,
            activeColor: const Color(0xff3458F5),
            iconSize: 30.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            duration: const Duration(milliseconds: 500),
            tabBackgroundColor: Colors.white,
            tabActiveBorder:
                Border.all(color: const Color(0xff3458F5), width: 2),
            color: const Color(0xff707070),
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
                iconColor: const Color(0xff707070),
                textStyle:
                    TextStyle(color: const Color(0xff3458F5), fontSize: 18.sp),
              ),
              GButton(
                icon: Icons.shopping_cart_outlined,
                text: 'My Sell',
                iconColor: const Color(0xff707070),
                textStyle:
                    TextStyle(color: const Color(0xff3458F5), fontSize: 18.sp),
              ),
              GButton(
                icon: Icons.message_outlined,
                text: 'Message',
                iconColor: const Color(0xff707070),
                textStyle:
                    TextStyle(color: const Color(0xff3458F5), fontSize: 18.sp),
              ),
              GButton(
                icon: Icons.person_outline_rounded,
                text: 'Profile',
                iconColor: const Color(0xff707070),
                textStyle:
                    TextStyle(color: const Color(0xff3458F5), fontSize: 18.sp),
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
