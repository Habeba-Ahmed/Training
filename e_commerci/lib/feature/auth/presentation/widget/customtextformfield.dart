import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/core/constant/style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixicon;
  final Widget? suffixicon; // ← change this line
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixicon,
    this.suffixicon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixicon != null ? Icon(prefixicon) : null,
        suffixIcon: suffixicon,
        prefixIconColor: AppColor.authiconcolor,
        hintText: hintText,
        hintStyle: AppTextStyle.hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: AppColor.fillcolor,
      ),
    );
  }
}
