import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/core/constant/text.dart';
import 'package:e_commerci/core/widget/customelevatedbutton.dart';
import 'package:e_commerci/feature/home_page/presentation/screens/homepage.dart';
import 'package:flutter/material.dart';

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
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },
        ),
      ),
      const SizedBox(height : 40), 
    ],
  );
  }
}