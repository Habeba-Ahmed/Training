import 'package:e_commerci/feature/onboarding/data/dataresource/static/onboarding_data.dart';
import 'package:e_commerci/feature/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:e_commerci/feature/onboarding/presentation/widget/custombody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit=context.read<OnboardingCubit>();
    return Expanded(
      child: PageView.builder(
        controller: cubit.pageController,
        onPageChanged: cubit.changePage,
        itemCount: onBoardingList.length,
        itemBuilder: (context, index) {
          final item = onBoardingList[index];
          return CustomBody(item: item);
        },
      ),
    );
  }
}