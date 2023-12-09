import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySellPage extends StatefulWidget {
  const MySellPage({Key? key}) : super(key: key);

  @override
  State<MySellPage> createState() => _MySellPageState();
}

class _MySellPageState extends State<MySellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4B91F1),
        title: Text(
          "My Sells",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard(),
        ],
      ),
    );
  }

  _buildCard() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h)),
      elevation: 2,
      child: Container(
        width: 360.w,
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.h)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel("Type: Carrot"),
            _buildLabel("Quantity: 10kg"),
            _buildLabel("Unit Price: Rs.100.00"),
            _buildLabel("Total Price: Rs.10000.00"),
            _buildLabel("Expire Date: 03/05/2022"),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBtn("Edit"),
                _buildBtn("Delete"),
                _buildBtn("Reject"),
                _buildBtn("Accept"),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildBtn(String btnName) {
    return Container(
      alignment: Alignment.center,
      width: 70.w,
      height: 30.h,
      decoration: BoxDecoration(
          color: const Color(0xFF4B91F1),
          borderRadius: BorderRadius.circular(5.h)),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          btnName,
          style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  _buildLabel(String name) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Text(
        name,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14.sp),
      ),
    );
  }
}
