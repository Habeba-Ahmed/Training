import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/core/constant/text.dart';
import 'package:e_commerci/core/widget/customelevatedbutton.dart';
import 'package:e_commerci/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_commerci/feature/auth/presentation/screens/resetpassword.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customheadertext.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderText(headrtText: AppText.headerTextforgetPassword),

            const SizedBox(height: 30),

            CustomTextFormField(
              controller: emailController,
              hintText: 'Enter your email address',
              prefixicon: Icons.email,
            ),

            const SizedBox(height: 20),

            RichText(
              text: TextSpan(
                style: AppTextStyle.agreementText,
                children: [
                  TextSpan(
                    text: '* ',
                    style: TextStyle(color: AppColor.primaryColor),
                  ),
                  const TextSpan(
                      text:
                          'We will send you a message to set or reset \nyour new password'),
                ],
              ),
            ),

            const SizedBox(height: 30),

            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthResetEmailSuccess) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Check Your Email'),
                        content: const Text(
                            "We've sent a reset link to your email."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ResetPassword(email: emailController.text,),
                                ),
                              );
                            },
                            child: const Text('Continue'),
                          ),
                        ],
                      );
                    },
                  );
                } else if (state is AuthResetEmailFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return CustomElevatedButton(
                  buttonText: 'Submit',
                  onPressed: () {
                    final email = emailController.text.trim();
                    if (email.isEmpty || !email.contains('@')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please enter a valid email')),
                      );
                      return;
                    }
                    context
                        .read<AuthCubit>()
                        .resetEmail(email: email);
                  },
                );
              },
            ),
          ],
        ),
      ),
    )
    );
  }
}
