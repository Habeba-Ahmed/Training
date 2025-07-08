import 'package:e_commerci/core/translate/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/core/widget/customelevatedbutton.dart';
import 'package:e_commerci/feature/auth/presentation/cubit/firebase/auth_cubit.dart';
import 'package:e_commerci/feature/auth/presentation/screens/signin.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customheadertext.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customtextformfield.dart';

// ignore: must_be_immutable
class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController _emailController = TextEditingController();
    AppText text=AppText();

  void _onSubmit(BuildContext context) {
    final email = _emailController.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text( text.keys['23']!)), // Please enter a valid email
      );
      return;
    }
    context.read<AuthCubitFireBase>().resetPassword(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubitFireBase(),
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 48.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeaderText(headrtText: text.keys['4']!), // Forgot password?
              SizedBox(height : 30.h),

              CustomTextFormField(
                controller: _emailController,
                hintText:  text.keys['20']!, // Enter your email address
                prefixicon: Icons.email,
              ),
              SizedBox(height : 20.h),

              RichText(
                text: TextSpan(
                  style: AppTextStyle.agreementText,
                  children: [
                    TextSpan(
                      text:  text.keys['25']!, // *
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                    TextSpan(
                      text:  text.keys['21']!, // Reset password instructions
                    ),
                  ],
                ),
              ),
              SizedBox(height : 30.h),

              BlocConsumer<AuthCubitFireBase, AuthStateFireBase>(
                listener: (context, state) {
                  if (state is AuthResetPasswordSuccessFireBase) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text( text.keys['24']!)), // Email sent
                    );
                    Get.off(() => const SignIn());
                  } else if (state is AuthResetPasswordFailedFireBase) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingFireBase) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return CustomElevatedButton(
                    buttonText:  text.keys['22']!, // Submit
                    onPressed: () => _onSubmit(context),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
