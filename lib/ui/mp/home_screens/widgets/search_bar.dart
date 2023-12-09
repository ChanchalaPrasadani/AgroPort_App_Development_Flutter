import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 360.w,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          Expanded(
            child: SizedBox(
              height: 30.h,
              child: TextField(
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  contentPadding: EdgeInsets.only(
                      top: 3.h, bottom: 3.h, left: 5.w, right: 15.w),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15.h),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15.h),
                  ),
                ),
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list))
        ],
      ),
    );
  }
}
