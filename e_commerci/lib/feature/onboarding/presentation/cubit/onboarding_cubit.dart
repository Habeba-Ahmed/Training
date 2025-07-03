import 'package:e_commerci/feature/auth/presentation/screens/signin.dart';
import 'package:e_commerci/feature/splash_screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/dataresource/static/onboarding_data.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnBoardingState> {
  OnboardingCubit() : super(OnBoardingPageChanged(0));

  final PageController pageController = PageController();
  int currentPage = 0;

  void nextPage(BuildContext context) {
    if (currentPage < onBoardingList.length - 1) {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      emit(OnBoardingPageChanged(currentPage));
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignIn()),
      );
    }
  }

  void prevPage(BuildContext context) {
    if (currentPage > 0) {
      currentPage--;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      emit(OnBoardingPageChanged(currentPage));
    }
  }

  void changePage(int index) {
    currentPage = index;
    emit(OnBoardingPageChanged(index));
  }
}
