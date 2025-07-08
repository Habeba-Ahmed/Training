import 'package:e_commerci/core/translate/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/core/widget/customelevatedbutton.dart';
import 'package:e_commerci/feature/auth/presentation/cubit/firebase/auth_cubit.dart';
import 'package:e_commerci/feature/auth/presentation/screens/signin.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customheadertext.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customtextformfield.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController _emailController = TextEditingController();

  void _onSubmit(BuildContext context) {
    final email = _emailController.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('23'.tr)), // Please enter a valid email
      );
      return;
    }
    context.read<AuthCubitFireBase>().resetPassword(email: email);
  }

  @override
  Widget build(BuildContext context) {
    AppText text=AppText();

    return BlocProvider(
      create: (_) => AuthCubitFireBase(),
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeaderText(headrtText: text.keys['4']!), // Forgot password?
              const SizedBox(height : 30),

              CustomTextFormField(
                controller: _emailController,
                hintText: text.keys['20']!, // Enter your email address
                prefixicon: Icons.email,
              ),
              const SizedBox(height : 20),

              RichText(
                text: TextSpan(
                  style: AppTextStyle.agreementText,
                  children: [
                    TextSpan(
                      text: text.keys['25']!,  // *
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                    TextSpan(
                      text: text.keys['21']!, // Message for resetting password
                    ),
                  ],
                ),
              ),
              const SizedBox(height : 30),

              BlocConsumer<AuthCubitFireBase, AuthStateFireBase>(
                listener: (context, state) {
                  if (state is AuthResetPasswordSuccessFireBase) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(text.keys['24']!)), // Password reset email sent
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
                    buttonText: text.keys['22']!, // Submit
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
