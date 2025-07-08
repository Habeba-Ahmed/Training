import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/core/constant/text.dart';
import 'package:e_commerci/core/widget/customelevatedbutton.dart';
import 'package:e_commerci/feature/auth/presentation/cubit/firebase/auth_cubit.dart';
import 'package:e_commerci/feature/auth/presentation/screens/signin.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customheadertext.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubitFireBase(),
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeaderText(headrtText: AppText.headerTextforgetPassword),
              const SizedBox(height : 30),

              CustomTextFormField(
                controller: _emailController,
                hintText: 'Enter your email address',
                prefixicon: Icons.email,
              ),
              const SizedBox(height : 20),

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
                          'We will send you a message to set or reset \nyour new password',
                    ),
                  ],
                ),
              ),
              const SizedBox(height : 30),

              BlocConsumer<AuthCubitFireBase, AuthStateFireBase>(
                listener: (context, state) {
                  if (state is AuthResetPasswordSuccessFireBase) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Password reset email sent')),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const SignIn()),
                    );
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
                    buttonText: 'Submit',
                    onPressed: () {
                      final email = _emailController.text.trim();
                      if (email.isEmpty || !email.contains('@')) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter a valid email')),
                        );
                        return;
                      }
                      context.read<AuthCubitFireBase>().resetPassword(email: email);
                    },
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
