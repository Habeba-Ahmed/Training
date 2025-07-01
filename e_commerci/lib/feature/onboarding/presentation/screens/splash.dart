
import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/core/constant/images.dart';
import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/core/constant/text.dart';
import 'package:e_commerci/feature/onboarding/presentation/screens/onboarding.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OnBoarding()),
    );
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
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
                AppText.logoText,
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
