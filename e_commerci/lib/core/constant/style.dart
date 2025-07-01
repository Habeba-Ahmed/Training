import 'package:e_commerci/core/constant/color.dart';
import 'package:flutter/material.dart';

class AppTextStyle{
  static final TextStyle logoStyle=TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: AppColor.primaryColor,
            fontFamily: 'Libre Caslon Text',
          );

  static final TextStyle  skipStyle=TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColor.blackColor,
            fontFamily: 'Montserrat',
          );

  static final TextStyle onboardingTitleStyle=TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: AppColor.blackColor,
            fontFamily: 'Montserrat',
          );

  static final TextStyle onboardingSubTitleStyle=TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColor.grayColor,
            fontFamily: 'Montserrat',
          );

  static final TextStyle prevStyle=TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColor.lightgrayColor,
            fontFamily: 'Montserrat',
          );

  static final TextStyle nextStyle=TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColor.secoundColor,
            fontFamily: 'Montserrat',
          );

}