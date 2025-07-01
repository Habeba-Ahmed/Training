import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/feature/onboarding/data/model/onboarding_model.dart';
import 'package:flutter/material.dart';

class CustomBody extends StatelessWidget {
  final OnboardingModel item;
  const CustomBody({super.key, required this.item});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(item.image, height : 250),
        const SizedBox(height : 20),
        Text(item.title, style: AppTextStyle.onboardingTitleStyle),
        const SizedBox(height : 12),
        Text(
          item.subtitle,
          style: AppTextStyle.onboardingSubTitleStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}