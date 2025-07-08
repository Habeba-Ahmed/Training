import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/feature/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:e_commerci/feature/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:e_commerci/feature/onboarding/presentation/widget/custombottombar.dart';
import 'package:e_commerci/feature/onboarding/presentation/widget/custompageview.dart';
import 'package:e_commerci/feature/onboarding/presentation/widget/customtopbar.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0.w), 
            child: BlocBuilder<OnboardingCubit, OnBoardingState>(
              builder: (context, state) {
                final currentIndex =
                    (state is OnBoardingPageChanged) ? state.pageIndex : 0;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTopBar(currentIndex: currentIndex),
                    const CustomPageView(),
                    CustomBottomBar(currentIndex: currentIndex),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
