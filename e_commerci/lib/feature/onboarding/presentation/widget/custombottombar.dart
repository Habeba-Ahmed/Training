import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/core/translate/text.dart';
import 'package:e_commerci/feature/onboarding/data/dataresource/static/onboarding_data.dart';
import 'package:e_commerci/feature/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:e_commerci/feature/onboarding/presentation/widget/customdotindicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  const CustomBottomBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    AppText text=AppText();
    final cubit = context.read<OnboardingCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        currentIndex == 0
            ? const SizedBox(width : 70)
            : TextButton(
                onPressed: () {
                  cubit.prevPage(context);
                },
                child: Text(text.keys['33']!, style: AppTextStyle.prevStyle), // Prev
              ),

        CustomDotIndicator(currentIndex: currentIndex),

        TextButton(
          onPressed: () {
            cubit.nextPage(context);
          },
          child: Text(
            currentIndex == onBoardingList.length - 1 ? text.keys['35']! : text.keys['34']!,
            style: AppTextStyle.nextStyle,
          ), // Get Started or Next
        ),
      ],
    );
  }
}
