import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/core/constant/text.dart';
import 'package:e_commerci/core/widget/customelevatedbutton.dart';
import 'package:e_commerci/feature/auth/presentation/cubit/FireBase/auth_cubit.dart';
import 'package:e_commerci/feature/auth/presentation/screens/signin.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customaddsocialsection.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customheadertext.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return BlocProvider(
      create: (context) => AuthCubitFireBase(),
      child: Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderText(headrtText: AppText.headerTextSignUp),
            const SizedBox(height : 30),
            CustomTextFormField(
              controller: usernameController, 
              hintText: 'Username or Email',
              prefixicon: Icons.person,
            ),
            const SizedBox(height : 20),
            CustomTextFormField(
              controller: passwordController, 
              hintText: 'Password',
              prefixicon: Icons.lock,
              suffixicon: Icon(Icons.remove_red_eye_outlined),
              obscureText: true,
            ),
            const SizedBox(height : 20),
            CustomTextFormField(
              controller: confirmPasswordController, 
              hintText: 'Confirm Password',
              prefixicon: Icons.lock,
              suffixicon: Icon(Icons.remove_red_eye_outlined),
              obscureText: true,
            ),
            const SizedBox(height : 30),
            RichText(
              text: TextSpan(
                style: AppTextStyle.agreementText,
                children: [
                  const TextSpan(text: 'By clicking the '),
                  TextSpan(
                    text: 'Register',
                    style: TextStyle(color: AppColor.primaryColor),
                  ),
                  const TextSpan(text: ' button, you agree\nto the public offer'),
                ],
              ),
            ),
            const SizedBox(height : 30),
            BlocConsumer<AuthCubitFireBase, AuthStateFireBase>(
              listener: (context, state) {
                if (state is AuthSignUpSuccessFireBase) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Created Account Successfu ')),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SignIn()),
                  );
                } else if (state is AuthSignUpFailedFireBase) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                final cubit = context.read<AuthCubitFireBase>();
                if (state is AuthLoadingFireBase) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomElevatedButton(
                  buttonText: 'Create Account',
                  onPressed: () {
                    cubit.signUp(
                      email: usernameController.text.trim(),
                      password: passwordController.text.trim(),
                      confirmpassword: confirmPasswordController.text
                    );
                  },
                );
              },
            ),
        const SizedBox(height : 60),
        Center(
          child: CustomAuthSocialSection(
            width : 250,
            hight: 140,
            normalText: 'I Already Have an Account',
            actionText: 'Login',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => SignIn()),
              );
            },
          ),
        ),
      ],
    ),
  ),
),


    )
    );
  }
}
