import 'package:e_commerci/core/constant/style.dart';
import 'package:flutter/material.dart';

class CustomHeaderText extends StatelessWidget {
  final String headrtText;
  const CustomHeaderText({super.key, required this.headrtText});

  @override
  Widget build(BuildContext context) {
    return Text(headrtText, style: AppTextStyle.headerText);
  }
}