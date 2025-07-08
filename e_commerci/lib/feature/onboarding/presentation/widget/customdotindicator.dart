import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/feature/onboarding/data/dataresource/static/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDotIndicator extends StatelessWidget {
  final int currentIndex;
  const CustomDotIndicator({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
      onBoardingList.length,
      (index) => AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        width : currentIndex == index?40.w:10.w,
        height : 10.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index
              ? AppColor.dot
              : AppColor.dotlight,
        ), duration: Duration(milliseconds: 600),
      ),
    ),
      ],
    );
  }
}