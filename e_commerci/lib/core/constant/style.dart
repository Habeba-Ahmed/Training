import 'package:e_commerci/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static final TextStyle logoStyle = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
    color: AppColor.primaryColor,
    fontFamily: 'Libre Caslon Text',
  );

  static final TextStyle skipStyle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.blackColor,
    fontFamily: 'Montserrat',
  );

  static final TextStyle onboardingTitleStyle = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    color: AppColor.blackColor,
    fontFamily: 'Montserrat',
  );

  static final TextStyle onboardingSubTitleStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.grayColor,
    fontFamily: 'Montserrat',
  );

  static final TextStyle prevStyle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.lightgrayColor,
    fontFamily: 'Montserrat',
  );

  static final TextStyle nextStyle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.secoundColor,
    fontFamily: 'Montserrat',
  );

  static final TextStyle headerText = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    color: AppColor.blackColor,
    fontFamily: 'Montserrat',
  );

  static final TextStyle hintText = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.hintcolor,
    fontFamily: 'Montserrat',
  );

  static final TextStyle orContinueText = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.gray500Color,
    fontFamily: 'Montserrat',
  );

  static final TextStyle createorhaveAccountText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.gray500Color,
    fontFamily: 'Montserrat',
  );

  static final TextStyle signuporloginText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.secoundColor,
    fontFamily: 'Montserrat',
    decoration: TextDecoration.underline,
    decorationColor: AppColor.secoundColor,
  );

  static final TextStyle agreementText = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.hintcolor,
    fontFamily: 'Montserrat',
  );

  static final TextStyle registerText = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.primaryColor,
    fontFamily: 'Montserrat',
  );

  static final TextStyle getStartTitle = TextStyle(
    fontSize: 34.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.backgroundColor,
    decoration: TextDecoration.none,
    fontFamily: 'Montserrat',
  );

  static final TextStyle getStartSubTitle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.getStartSubTitle,
    decoration: TextDecoration.none,
    fontFamily: 'Montserrat',
  );
}
