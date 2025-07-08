
import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/core/constant/images.dart';
import 'package:e_commerci/core/constant/routes/redirectroute.dart';
import 'package:e_commerci/core/constant/routes/routes.dart';
import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/core/constant/text.dart';
import 'package:e_commerci/feature/onboarding/presentation/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      final redirectRoute = ReDirectRoute.redirect(null).name;
      if (redirectRoute != null) {
        Get.offAllNamed(redirectRoute);
      } else {
        Get.offAllNamed(AppRoutes.onBoarding); // fallback just in case
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width : 275,
            height : 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(
                width : 125,
                height : 100,
                child: Image.asset(AppImages.logo),
              ),
              
              const SizedBox(width : 10),

              Text(
                '1'.tr,
                style: AppTextStyle.logoStyle
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}
