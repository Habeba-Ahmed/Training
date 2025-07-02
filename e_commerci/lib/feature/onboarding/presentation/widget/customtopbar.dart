import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/feature/auth/presentation/screens/signin.dart';
import 'package:e_commerci/feature/onboarding/data/dataresource/static/onboarding_data.dart';
import 'package:e_commerci/feature/onboarding/presentation/screens/splash.dart';
import 'package:flutter/material.dart';

class CustomTopBar extends StatelessWidget {
  final int currentIndex; 
  const CustomTopBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('${currentIndex + 1}',style: AppTextStyle.skipStyle,),
            Text('/',style: AppTextStyle.prevStyle,),
            Text('${onBoardingList.length}',style: AppTextStyle.prevStyle,)
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
          },
          child: Text('Skip', style: AppTextStyle.skipStyle),
        ),
      ],
    );
  }
}