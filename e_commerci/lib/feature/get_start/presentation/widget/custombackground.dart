import 'package:e_commerci/core/constant/images.dart';
import 'package:flutter/material.dart';

class CustomBackgroundImage extends StatelessWidget {
  const CustomBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width : double.infinity,
      height : double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.getstart),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}