import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/core/constant/images.dart';
import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customauthbottomtext.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customsocialcircleicon.dart';
import 'package:flutter/material.dart';

class CustomAuthSocialSection extends StatelessWidget {
  final String normalText;
  final String actionText;
  final void Function() onPressed;
  const CustomAuthSocialSection({super.key, required this.normalText, required this.actionText,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width : 194,
      height : 136,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('- OR Continue with -',style: AppTextStyle.orContinueText,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              CustomSocialCircleIcon(
                widget: SizedBox(
                  height : 24,
                  width : 24,
                  child: Image.asset(AppImages.google,fit: BoxFit.contain,))),
              
              CustomSocialCircleIcon(
                widget: Icon(Icons.apple,size: 25,color: AppColor.blackColor,)),
              
              CustomSocialCircleIcon(
                widget: Icon(Icons.facebook_rounded,size: 25,color:  Color(0xff3D4DA6))),
              
            ],
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