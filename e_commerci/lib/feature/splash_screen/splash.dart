
import 'package:e_commerci/core/constant/images.dart';
import 'package:e_commerci/core/constant/routes/redirectroute.dart';
import 'package:e_commerci/core/constant/routes/routes.dart';
import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/core/translate/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


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
            width : 275.w,
            height : 100.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(
                width : 125.w,
                height : 100.h,
                child: Image.asset(AppImages.logo),
              ),
              
              SizedBox(width : 10.w),

              Text(
                AppText().keys['1']!,
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
