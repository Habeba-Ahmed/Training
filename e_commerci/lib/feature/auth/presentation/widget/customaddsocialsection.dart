import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/core/constant/images.dart';
import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customauthbottomtext.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customsocialcircleicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthSocialSection extends StatelessWidget {
  final String normalText;
  final String actionText;
  final void Function() onPressed;
  final double width;
  final double hight;
  const CustomAuthSocialSection({
    super.key, 
    required this.normalText, 
    required this.actionText,
    required this.onPressed, 
    required this.width, 
    required this.hight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width : width,
      height : hight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('- OR Continue with -',style: AppTextStyle.orContinueText,),
          SizedBox(height : 10.h,),
          Center(
            child: Row(
              spacing : 10.w ,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                CustomSocialCircleIcon(
                  widget: SizedBox(
                    height : 24.h,
                    width : 24.w,
                    child: Image.asset(AppImages.google,fit: BoxFit.contain,))),
                
                CustomSocialCircleIcon(
                  widget: Icon(Icons.apple,size: 25,color: AppColor.blackColor,)),
                
                CustomSocialCircleIcon(
                  widget: Icon(Icons.facebook_rounded,size: 25.sp,color:  Color(0xff3D4DA6))),
                
              ],
            ),
          ),

          CustomAuthBottomText(
            normalText: normalText, 
            actionText: actionText, 
            onPressed: onPressed)
        ],
      ),
    );
            
  }
}