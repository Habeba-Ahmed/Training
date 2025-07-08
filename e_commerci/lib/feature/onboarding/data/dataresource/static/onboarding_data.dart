import 'package:e_commerci/core/constant/images.dart';
import 'package:e_commerci/core/translate/text.dart';
import 'package:e_commerci/feature/onboarding/data/model/onboarding_model.dart';

List<OnboardingModel> onBoardingList = [
  OnboardingModel(
    image: AppImages.onboarding1,
    title: AppText().keys['29']!,     // "Choose Products"
    subtitle: AppText().keys['30']!,  // Onboarding description
  ),
  OnboardingModel(
    image: AppImages.onboarding2,
    title: AppText().keys['31']!,     // "Make Payment"
    subtitle: AppText().keys['30']!,
  ),
  OnboardingModel(
    image: AppImages.onboarding3,
    title: AppText().keys['23']!,     // "Get Your Order"
    subtitle: AppText().keys['30']!,
  ),
];
