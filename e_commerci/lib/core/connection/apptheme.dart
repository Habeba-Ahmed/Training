import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color getStartSubTitle = Color(0xFFF2F2F2);
  static const Color primaryColor = Color(0xFFEF426F);
  static const Color secoundColor = Color(0xFFF83758);
  static const Color ligthPinkColor = Color(0xFFFCF3F6);
  static const Color blackColor = Color(0xFF000000);
  static const Color grayColor = Color(0xFFA8A8A9);
  static const Color gray500Color = Color(0xFF575757);
  static const Color lightgrayColor = Color(0xFFC4C4C4);
  static final Color dotlight = const Color(0xFF17223B).withOpacity(0.33);
  static const Color dot = Color(0xFF17223B);
  static const Color hintcolor = Color(0xFF676767);
  static const Color authiconcolor = Color(0xFF626262);
  static const Color fillcolor = Color(0xFFF3F3F3);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundColor,
      primaryColor: AppColors.primaryColor,
      hintColor: AppColors.hintcolor,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.fillcolor,
        filled: true,
        hintStyle: TextStyle(
          color: AppColors.hintcolor,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle( // logoStyle
          fontSize: 40,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryColor,
          fontFamily: 'Libre Caslon Text',
        ),
        titleLarge: TextStyle( // onboardingTitleStyle / headerText
          fontSize: 24,
          fontWeight: FontWeight.w800,
          color: AppColors.blackColor,
          fontFamily: 'Montserrat',
        ),
        titleMedium: TextStyle( // skipStyle / prevStyle / nextStyle
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.blackColor,
          fontFamily: 'Montserrat',
        ),
        titleSmall: TextStyle( // onboardingSubTitleStyle
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.grayColor,
          fontFamily: 'Montserrat',
        ),
        bodyLarge: TextStyle( // hintText / agreementText
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.hintcolor,
          fontFamily: 'Montserrat',
        ),
        bodyMedium: TextStyle( // orContinueText / createorhaveAccountText
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.gray500Color,
          fontFamily: 'Montserrat',
        ),
        bodySmall: TextStyle( // signuporloginText
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.secoundColor,
          fontFamily: 'Montserrat',
          decoration: TextDecoration.underline,
          decorationColor: AppColors.secoundColor,
        ),
        displaySmall: TextStyle( // getStartTitle
          fontSize: 34,
          fontWeight: FontWeight.w600,
          color: AppColors.backgroundColor,
          fontFamily: 'Montserrat',
        ),
        labelMedium: TextStyle( // getStartSubTitle
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.getStartSubTitle,
          fontFamily: 'Montserrat',
        ),
        labelSmall: TextStyle( // registerText
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryColor,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}
