import 'package:e_commerci/core/cache/chachehelper.dart';
import 'package:e_commerci/core/constant/routes/routes.dart';
import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/core/constant/text.dart';
import 'package:e_commerci/core/widget/customelevatedbutton.dart';
import 'package:e_commerci/feature/home_page/presentation/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomBodyGetStart extends StatelessWidget {
  const CustomBodyGetStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppText.getStartTitle,
          style: AppTextStyle.getStartTitle,
          textAlign: TextAlign.center,
        ),
        Text(
          AppText.getStartSubTitle,
          style: AppTextStyle.getStartSubTitle,
          textAlign: TextAlign.center,
        ),

      SizedBox(
        width : 279,
        child: CustomElevatedButton(
          buttonText: 'Get Start',
          onPressed: () {
            Chachehelper.setDate(key: 'step', value: '3');
            Get.offAllNamed(AppRoutes.homepage);
          },
        ),
      ),
      const SizedBox(height : 40), 
    ],
  );
  }
}