import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/feature/onboarding/data/dataresource/static/onboarding_data.dart';
import 'package:flutter/material.dart';

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
        margin: const EdgeInsets.symmetric(horizontal: 2),
        width : currentIndex == index?40:10,
        height : 10,
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