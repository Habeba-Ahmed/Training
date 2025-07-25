import 'package:e_commerci/core/cache/chachehelper.dart';
import 'package:e_commerci/core/constant/routes/routes.dart';
import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/core/translate/text.dart';
import 'package:e_commerci/feature/onboarding/data/dataresource/static/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            Chachehelper.setDate(key: 'step', value: '1');
            Get.offAllNamed(AppRoutes.signin);
          },
          child: Text(AppText().keys['36']!, style: AppTextStyle.skipStyle),
        ),
      ],
    );
  }
}