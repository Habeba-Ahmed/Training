import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/core/constant/style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixicon;
  final IconData? suffixicon;
  final bool obscureText;
  const CustomTextFormField({
    super.key, 
    required this.controller, 
    required this.hintText, 
    this.prefixicon, 
    this.obscureText=false, 
    this.suffixicon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixicon),
        suffixIcon: Icon(suffixicon),
        prefixIconColor: AppColor.authiconcolor,
        hintText: hintText,
        hintStyle: AppTextStyle.hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        fillColor: AppColor.lightgrayColor.withOpacity(0.1),
      ),
    );
  }
}